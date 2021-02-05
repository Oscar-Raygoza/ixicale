# -*- coding: utf-8 -*-
"""
    app.extensions.db
    ~~~~~~~~~~~~~~

    Setup DB

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from config import app
from config import base
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
import os

__all__ = ["db"]

#: Retrieves DB URI connection from secrets
db_uri = base.get_db_uri()
app.config.update({"SQLALCHEMY_DATABASE_URI": db_uri})

#: SQLAlchemy project variable
db = SQLAlchemy(app)

#: Test connection
try:
    db.session.query("1").from_statement(text("SELECT 1")).all()
    app.logger.info("SUCCESS: Connected to DB")
except Exception:
    app.logger.error("ERROR: Could not connect to '%s'" % db_uri)
    os._exit(1)
