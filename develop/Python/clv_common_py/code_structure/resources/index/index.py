# -*- coding: utf-8 -*-
"""
    resources.index.index
    ~~~~~~~~~~~~~~

    Resources for index module

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from flask_restful import Resource
from config import base


class Index(Resource):
    """ Index resource """

    def get(self):
        data = {"branch": base.environment, "release": base.app_release}
        return base.build_success_response(200, data)
