# -*- coding: utf-8 -*-
"""
    schemas.region
    ~~~~~~~~~~~~~~

    Autogenerated schema 'RegionSchema'

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from config import ma
from marshmallow import EXCLUDE
from models.region import RegionModel

__all__ = ["RegionSchema"]


class Schema(ma.ModelSchema):
    class Meta:
        model = RegionModel
        strict = True
        ordered = True
        unknown = EXCLUDE


class CreateSchema(Schema):
    class Meta(Schema.Meta):
        exclude = (
            "iddef_region",
            "fecha_ultima_modificacion",
            "usuario_ultima_modificacion",
        )


class UpdateSchema(Schema):
    class Meta(Schema.Meta):
        exclude = ("fecha_creacion", "usuario_creacion")


class RegionSchema:

    select = Schema()
    select_many = Schema(many=True)
    create = CreateSchema()
    update = UpdateSchema()