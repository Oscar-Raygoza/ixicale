# -*- coding: utf-8 -*-
"""
    app.extensions.ma
    ~~~~~~~~~~~~~~

    Object serialization/deserialization library

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from flask_marshmallow import Marshmallow
from config import app


ma = Marshmallow(app)
