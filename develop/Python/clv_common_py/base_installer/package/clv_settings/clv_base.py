# -*- coding: utf-8 -*-
"""
BaseController have common tasks (methods) that will be used in most of all
Resources.
"""
from collections import ChainMap
from flask import request
from functools import wraps
from requests import Timeout
import requests
import base64
import json

__all__ = ["BaseController"]

INFO_CODES = {100: "Continue", 101: "Switching Protocols"}

SUCCESS_CODES = {
    200: "Ok",
    201: "Created",
    202: "Accepted",
    203: "Non-Authoritative Information",
    204: "No Content",
    205: "Reset Content",
    206: "Partial Content",
}

REDIRECTION_CODES = {
    300: "Multiple Choices",
    301: "Moved Permanently",
    302: "Found",
    303: "See Other",
    304: "Not Modified",
    307: "Temporary Redirect",
    308: "Permanent Redirect",
}

CLIENT_ERROR_CODES = {
    400: "Bad Request",
    401: "Unauthorized",
    403: "Forbidden",
    404: "Not Found",
    405: "Method Not Allowed",
    406: "Not Acceptable",
    407: "Proxy Authentication Required",
    408: "Request Timeout",
    409: "Conflict",
    410: "Gone",
    411: "Length Required",
    412: "Precondition Failed",
    413: "Request Entity Too Large",
    414: "Request URI Too Large",
    415: "Unsupported Media Type",
    416: "Range Not Satisfiable",
    417: "Expectation Failed",
    418: "I'm a teapot",
    422: "Unprocessable Entity",
    425: "Too Early",
    426: "Upgrade Required",
    428: "Precondition Required",
    429: "TooManyRequests",
    431: "Request Header Fields Too Large",
    451: "Unavailable For Legal",
}

SERVER_ERROR_CODES = {
    500: "Internal Server Error",
    501: "Not Implemented",
    502: "Bad Gateway",
    503: "Service Unavailable",
    504: "Gateway Timeout",
    505: "HTTP Version Not Supported",
    511: "Network Authentication Required",
}

ERROR_CODES = dict(ChainMap(SERVER_ERROR_CODES, CLIENT_ERROR_CODES))


class BaseController:
    def __init__(self, app=None):
        #: Set logger
        self.__LOGGER = app.logger
        #: Set config
        self.__CONFIG = app.config

    @property
    def environment(self):
        return self.app_config("APP_ENV")

    @property
    def system_id(self):
        return self.app_config("SYSTEM_ID")

    @property
    def app_name(self):
        return self.app_config("APP_NAME")

    @property
    def app_release(self):
        return self.app_config("DATE_RELEASE")

    @property
    def dtc_url(self):
        return "http://127.0.0.1:9010"

    # Decorator to validate Bearer Token in request.
    def access_middleware(self, func):
        """ Resource decorator to validate token """

        @wraps(func)
        def wrapper(*args, **kwargs):
            error_message = "An error has occurred!"
            if "Authorization" not in request.headers:
                error_message = "EMPTY TOKEN OR NOT RECEIVED"
                return self.build_error_response(400, error_message)
            else:
                url_auth = "%s/acl/acl/%s/%s/%s" % (
                    self.get_url("auth"),
                    request.endpoint,
                    request.method.lower(),
                    self.system_id,
                )
                response, status, _ = self.request(url=url_auth)
                if "allowed_access" in response:
                    if not response["allowed_access"]:
                        error_message = response["message"]
                        return self.build_error_response(
                            403, message=error_message
                        )
                else:
                    error_message = "BAD TOKEN GET A NEW ONE"
                    return self.build_error_response(
                        401, message=error_message
                    )
                #: Execute function if it is allowed
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    self.__LOGGER.exception(str(e))
                    return self.build_error_response(500, error_message)

        return wrapper

    def decode_base64_json(self, data):
        """ Decodes a base64 data """

        try:
            return json.loads(base64.b64decode(data.decode("utf-8")))
        except Exception:
            return {}

    def encode_base64_json(self, data):
        """ Encode data to base64 """

        return base64.b64encode(data.encode("UTF-8"))

    def app_config(self, key):
        """ Returns Flask.config global variables """

        return self.__CONFIG.get(key, "")

    def build_success_response(self, status, data={}, message="", **kargs):
        """ JSON response for 2XX codes """

        #: Returns nothing if not content
        if status == 204:
            return None, status
        elif status == 200 and data is None:
            data = {}
        #: Just return 2XX codes
        if status not in SUCCESS_CODES:
            return self.build_error_response(status, message)
        #: Set message code if message is empty
        if message == "":
            message = SUCCESS_CODES.get(status, "")
        #: Response structure
        response = {
            "success": True,
            "status": status,
            "message": message,
            "data": data,
        }
        if len(kargs) == 0 and status == 200:
            return response, status
        for key in kargs:
            response[key] = kargs[key]
        return response, status

    def build_error_response(self, status, errors={}, message="", **kargs):
        """ JSON response for 4XX and 5XX codes """

        if status not in ERROR_CODES:
            status = 500
        if message == "":
            message = ERROR_CODES.get(status, "")
        response = {"success": False, "status": status, "message": message}
        if status == 400:
            response["errors"] = errors
        for key in kargs:
            response[key] = kargs[key]
        return response, status

    def __werkzeug_error_message(self, status=500):
        """ Message to show in werkzeug error """

        response, _ = self.build_error_response(status)
        return response

    def request(
        self,
        url="",
        method="get",
        data={},
        content_type="application/json",
        timeout=15,
        use_token=True,
    ):
        """Make HTTP GET/POST/PUT requests"""

        #: Response
        resp = None
        resp_status = None
        resp_headers = {}
        #: Request headers
        headers = {"content-type": content_type}
        if use_token and "Authorization" in request.headers:
            headers["Authorization"] = request.headers["Authorization"]
        try:
            #: Parse to JSON if is application/json
            req_data = (
                json.dumps(data)
                if content_type == "application/json"
                else data
            )
            if method == "post":
                response = requests.post(url, data=req_data, headers=headers)
            elif method == "put":
                response = requests.put(url, data=req_data, headers=headers)
            else:
                response = requests.get(url, headers=headers)
            resp_headers = response.headers
            resp_status = response.status_code
            resp = (
                json.loads(response.content)
                if "application/json" in resp_headers["Content-Type"]
                else response.content
            )
        except Timeout as e:
            print(str(e))
            pass
        except Exception as e:
            print(str(e))
            pass
        return resp, resp_status, resp_headers

    def get_url(self, module, environment=None):
        """ Gets API urls """

        env = self.app_config("APP_ENV") if not environment else environment
        url = self.__CONFIG["URLS"].get(env, "dev").get(module, "")
        return url

    def get_db_uri(self):
        """ Retrieves database secret from AWS """

        secret_name = self.app_config("DB_SECRET_NAME")
        url = "%s/secrets/%s" % (self.dtc_url, secret_name)
        response, status, _ = self.request(url, use_token=False)
        if status == 200:
            dbapi = self.app_config("SQLALCHEMY_DBAPI")
            params = self.app_config("SQLALCHEMY_PARAMS")
            if type(params) is dict:
                params = "?%s" % "".join(
                    [
                        "&%s=%s" % (key, value)
                        for (key, value) in params.items()
                    ]
                )
            username = response.get("username", "")
            password = response.get("password", "")
            host = response.get("host", "")
            port = response.get("port", "")
            database = response.get("dbname", "")
            db_uri = "{}://{}:{}@{}:{}/{}{}".format(
                dbapi, username, password, host, port, database, params
            )
            return db_uri
        else:
            return self.app_config("SQLALCHEMY_DATABASE_URI")

    def save_log(self, message):
        """ Saving logs in AWS """

        pass

    def werkzeug_errors(self):
        """ Custom errors for flask_restful """

        errors = {
            "BadRequest": self.__werkzeug_error_message(400),
            "Unauthorized": self.__werkzeug_error_message(401),
            "Forbidden": self.__werkzeug_error_message(403),
            "NotFound": self.__werkzeug_error_message(404),
            "MethodNotAllowed": self.__werkzeug_error_message(405),
            "NotAcceptable": self.__werkzeug_error_message(406),
            "RequestTimeout": self.__werkzeug_error_message(408),
            "Conflict": self.__werkzeug_error_message(409),
            "Gone": self.__werkzeug_error_message(410),
            "RequestEntityTooLarge": self.__werkzeug_error_message(413),
            "RequestURITooLarge": self.__werkzeug_error_message(414),
            "ExpectationFailed": self.__werkzeug_error_message(417),
            "TooManyRequests": self.__werkzeug_error_message(429),
            "InternalServerError": self.__werkzeug_error_message(500),
            "ServiceUnavailable": self.__werkzeug_error_message(503),
        }
        return errors

    def get_username(self):
        """ Retrieve username from the current request """

        username = None
        try:
            data = request.get_json(force=True)
            if "usuario_ultima_modificacion" in data:
                return data["usuario_ultima_modificacion"]
            elif "usuario_ultima_modificacion" in request.form:
                return request.form["usuario_ultima_modificacion"]
            elif "usuario_creacion" in data:
                return data["usuario_creacion"]
            elif "usuario_creacion" in request.form:
                return request.form["usuario_creacion"]
            return username
        except Exception:
            return username

    def get_HTML_codes(self, targets=["SUCCESS"]):
        return (
            dict(
                ChainMap(
                    SUCCESS_CODES if "SUCCESS" in targets else {},
                    REDIRECTION_CODES if "REDIRECTION" in targets else {},
                    CLIENT_ERROR_CODES if "CLIENT_ERROR" in targets else {},
                    SERVER_ERROR_CODES if "SERVER_ERROR" in targets else {},
                )
            )
            if (type(targets) == list)
            else {}
        )
