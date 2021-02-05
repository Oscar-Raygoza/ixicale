# -*- coding: utf-8 -*-
"""
    config.urls
    ~~~~~~~~~~~~~~

    List of urls that will be consulted

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""

#: Clever's url
#: NOTE auth and dtc are reserved and will be added automatically.
URLS = {
    "dev": {"auth": "http://auth-api-qa.clever.palace-resorts.local"},
    "qa": {"auth": "http://auth-api-qa.clever.palace-resorts.local"},
    "pro": {"auth": "http://auth-api.clever.palace-resorts.local"},
}
