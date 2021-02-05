# -*- coding: utf-8 -*-
"""
    config.flask
    ~~~~~~~~~~~~~~

    Setup Flask configuration

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from flask import Flask
from flask_cors import CORS
from logging.config import dictConfig
from datetime import datetime
from .urls import URLS
from clv_settings import BaseController
import logging

__all__ = ["app", "base"]

#: Defines project environment dev, qa or pro
ENVIRONMENT = "dev"

#: Logger configuration
LOGGER_FORMAT = (
    "%(asctime)s %(name)-4s %(levelname)-4s in %(module)s: %(message)s"
)

#: Set logging handlers
handlers = {
    #: Send logs to HTTP DTC API
    "http_handler": {
        "class": "logging.handlers.HTTPHandler",
        "formatter": "default",
        "level": "ERROR",
        "host": "127.0.0.1:9010",
        "url": "/logger",
        "secure": False,
        "method": "POST",
    },
    #: Send logs to console
    "wsgi": {
        "class": "logging.StreamHandler",
        "stream": "ext://flask.logging.wsgi_errors_stream",
    },
}
root = {"handlers": ["http_handler", "wsgi"]}

if ENVIRONMENT == "dev":
    #: Send logs to file
    handlers["file_handler"] = {
        "class": "logging.FileHandler",
        "formatter": "default",
        "filename": "app.log",
        "mode": "a",
        "level": "ERROR",
    }
    root["handlers"].append("file_handler")

dictConfig(
    {
        "version": 1,
        "formatters": {"default": {"format": LOGGER_FORMAT}},
        "handlers": handlers,
        "root": root,
    }
)


class Config(object):
    """Flask configurations"""

    #: Project description
    DATE_RELEASE = "MMM, DD, YYYY"

    #: Project config values
    APP_NAME = ""
    SYSTEM_MODULE = ""
    SYSTEM_ID = 0
    TMP_PATH = "/tmp"
    DB_SECRET_NAME = ""
    SQLALCHEMY_DBAPI = "mysql+pymysql"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_PARAMS = {"charset": "utf8"}

    #: Sqlalchemy config values
    SQLALCHEMY_DB_USER = "clv-proagent-adm"
    SQLALCHEMY_DB_PWD = "0N<X2y@N+48qBr"
    SQLALCHEMY_DB_NAME = "clv_proagent"
    SQLALCHEMY_DATABASE_URI = "%s://%s:%s@%s/%s" % (
        SQLALCHEMY_DBAPI,
        SQLALCHEMY_DB_USER,
        SQLALCHEMY_DB_PWD,
        "mysqldev57-cluster.cluster-cdrfidjuoewu.us-east-1.rds.amazonaws.com",
        SQLALCHEMY_DB_NAME,
    )

    #: Project's urls
    URLS = URLS


class PROConfig(Config):
    #: App config values
    APP_ENV = "pro"


class QAConfig(Config):
    #: App config values
    APP_ENV = "qa"


class DEVConfig(Config):
    #: App config values
    APP_ENV = "dev"


#: Flask app instance
app = Flask(__name__)
#: Set Flask configs
if ENVIRONMENT == "pro":
    app.config.from_object(PROConfig)
elif ENVIRONMENT == "qa":
    app.config.from_object(QAConfig)
else:
    app.config.from_object(DEVConfig)
#: Setup CORS
CORS(app)
#: Setup base
base = BaseController(app)

#: Add params to logger object
old_factory = logging.getLogRecordFactory()


def record_factory(*args, **kwargs):
    record = old_factory(*args, **kwargs)
    record.datetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    record.username = base.get_username()
    record.environment = base.environment
    record.app_name = base.app_name
    return record


logging.setLogRecordFactory(record_factory)
