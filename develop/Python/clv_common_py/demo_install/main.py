from flask import Flask
from clv_settings import BaseController


class Config(object):
    """Flask configurations"""

    #: Project description
    DATE_RELEASE = "MMM, DD, YYYY"


app = Flask(__name__)
app.config.from_object(Config)


base = BaseController(app)
