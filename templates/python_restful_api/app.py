# -*- coding: utf-8 -*-
"""
    app
    ~~~~~~~~~~~~~~

    Import flask instance from config package to use in deploy

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
import os
from dotenv import load_dotenv

dotenv_path = os.path.join(
    os.path.dirname(__file__), ".env"
)  # Path to .env file
load_dotenv(dotenv_path)
print(dotenv_path)

from config import app
