# -*- coding: utf-8 -*-
"""
    resources.index
    ~~~~~~~~~~~~~~

    Endpoints for index

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from config import api
from .index import Index


api.add_resource(Index, "/")
