# -*- coding: utf-8 -*-
"""
    setup
    ~~~~~~~~~~~~~~

    package installer to 'clv_settings' package

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""

import os
import sys
from setuptools import setup, find_packages

not_found_msg = """
File Not Found ({fname}).
Check the file and restart again
"""


def get_file_content(fname):
    fname = os.path.abspath(os.path.dirname(__file__)) + "/" + fname
    exists = os.path.isfile(fname)
    if not exists:
        print(not_found_msg.format(fname=fname))
        sys.exit(1)
    with open(fname) as f:
        return f.read()


CURRENT_PYTHON = sys.version_info[:2]
REQUIRED_PYTHON = (3, 6)
#: This check and everything above must remain compatible with requiered Python
if CURRENT_PYTHON < REQUIRED_PYTHON:
    quant_language = 2
    print(
        get_file_content("setup/required_python.txt").format(
            *(quant_language * (REQUIRED_PYTHON + CURRENT_PYTHON))
        )
    )
    sys.exit(1)


"""
Inside a virtualenv, sys.prefix points to the virtualenv directory, and
sys.real_prefix points to the "real" prefix of the system Python (often /usr or
/usr/local or some such).

Outside a virtualenv, sys.real_prefix should not exist.
"""
#: This Check if this script is running into virtual environment
if "VIRTUAL_ENV" not in list(os.environ):
    print("""ERROR: The virtual environment is not activated!""")
    sys.exit(1)


PROJECT_NAME = "clv_common_py"
PROJECT_VERSION = "2020.01.29.1"
PROJECT_DESCRIPTION = "Common project that sets the default configuration."
LONG_DESC = get_file_content("README.md")
REQUIRES = get_file_content("requirements.txt").splitlines()
DOM_URL = "https://github.com/fbenitez/clv_common_py"

setup(
    #: - - - - - name - - - - -
    #: The name of the package
    #: a string
    name=PROJECT_NAME,
    #: - - - - - version - - - - -
    #: The version number of the package; see distutils.version
    #: a string
    version=PROJECT_VERSION,
    #: - - - - - install_requires - - - - -
    #: A list of standalone script files to be built and installed
    #: a list of strings
    install_requires=REQUIRES,
    #: - - - - - description - - - - -
    #: A single line describing the package
    #: a string
    description=PROJECT_DESCRIPTION,
    #: - - - - - long_description - - - - -
    #: Longer description of the package
    #: a string
    long_description=LONG_DESC,
    #: - - - - - packages - - - - -
    #: A list of Python packages that distutils will manipulate
    #: a list of strings
    packages=find_packages("package"),
    #: - - - - - package_dir - - - - -
    #:
    package_dir={"": "package"},
    #: - - - - - author - - - - -
    #: The name of the package author
    #: a string
    author="ixicale",
    #: - - - - - author_email - - - - -
    #: The email address of the package author
    #: a string
    author_email="ixicale@palaceresorts.com",
    #: - - - - - maintainer - - - - -
    #: The name of the current maintainer, if different from the author.
    #:   Note that if the maintainer is provided, distutils will use it as
    #:   the author in PKG-INFO
    #: a string
    maintainer="Clever Software",
    #: - - - - - maintainer_email - - - - -
    #: The email address of the current maintainer, if different from the
    #:  author
    #: a string
    # maintainer_email="",
    #: - - - - - url - - - - -
    #: A URL for the package (homepage)
    #: a string
    url="{}/tree/master/base_installer".format(DOM_URL),
    #: - - - - - download_url - - - - -
    #: A URL to download the package
    #: a string,
    download_url="{}/releases/tag/clv_settings.{}".format(
        DOM_URL, PROJECT_VERSION
    ),
    #: - - - - - py_modules - - - - -
    #: A list of Python modules that distutils will manipulate
    #: a list of strings
    # py_modules=["config.clv_base", "config.http"],
    #: - - - - - scripts - - - - -
    #: A list of standalone script files to be built and installed
    #: a list of strings
    # scripts=[""],
    #: - - - - - ext_modules - - - - -
    #: A list of Python extensions to be built
    #: a list of instances of distutils.core.Extension
    # ext_modules=[""],
    #: - - - - - classifiers - - - - -
    #: A list of categories for the package
    #: a list of strings; valid classifiers are listed on PyPI.
    # classifiers=[""],
    #: - - - - - script_name - - - - -
    #: The name of the setup.py script - defaults to sys.argv[0]
    #: a string
    # script_name="",
    #: - - - - - script_args - - - - -
    #: Arguments to supply to the setup script
    #: a list of strings
    # script_args=[""],
    #: - - - - - options - - - - -
    #: default options for the setup script
    #: a dictionary
    # options={""},
    #: - - - - - license - - - - -
    #: The license for the package
    #: a string
    # license="",
    #: - - - - - keywords - - - - -
    #: Descriptive meta-data, see PEP 314
    #: a list of strings or a comma-separated string
    # keywords="" | [""],
    #: - - - - - platforms - - - - -
    #: a list of strings or a comma-separated string
    # platforms=[""],
    #: - - - - - cmdclass - - - - -
    #: A mapping of command names to Command subclasses
    #: a dictionary
    # cmdclass={""},
    #: - - - - - data_files - - - - -
    #: A list of data files to install
    #: a list
    # data_files=[""],
)
