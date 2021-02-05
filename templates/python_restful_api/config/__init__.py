# -*- coding: utf-8 -*-
"""
    config
    ~~~~~~~~~~~~~~

    Setup app context and extensions

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from .flask import app, base
from .extensions.api import api
from .extensions.db import db
from .extensions.ma import ma
from .routes import *
