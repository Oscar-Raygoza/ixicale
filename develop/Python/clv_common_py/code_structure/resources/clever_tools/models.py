# -*- coding: utf-8 -*-
"""
    resources.clever_tools.models
    ~~~~~~~~~~~~~~

    Geneate model and schema

    :copyright: (c) 2019 by Software Clever, Palace Resorts CEDIS.
    :author: lresendiz
    :author: ixicale
    :license: Private.
"""
from config import db, base, app
from flask_restful import Resource
import os
import sys
import re

mysql_dialects = [
    "BIGINT",
    "BINARY",
    "BIT",
    "BLOB",
    "BOOLEAN",
    "CHAR",
    "DATE",
    "DATETIME",
    "DECIMAL",
    "DOUBLE",
    "ENUM",
    "FLOAT",
    "INTEGER",
    "JSON",
    "LONGBLOB",
    "LONGTEXT",
    "MEDIUMBLOB",
    "MEDIUMINT",
    "MEDIUMTEXT",
    "NCHAR",
    "NUMERIC",
    "NVARCHAR",
    "REAL",
    "SET",
    "SMALLINT",
    "TEXT",
    "TIME",
    "TIMESTAMP",
    "TINYBLOB",
    "TINYINT",
    "TINYTEXT",
    "VARBINARY",
    "VARCHAR",
    "YEAR",
]
as_string = ["DECIMAL", "FLOAT", "DOUBLE", "DATETIME", "DATE", "TIMESTAMP"]
default_fields = [
    "usuario_creacion",
    "fecha_creacion",
    "usuario_ultima_modificacion",
    "fecha_ultima_modificacion",
    "estado",
]
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


model_file_content = get_file_content("template_m.txt")
schema_file_content = get_file_content("template_s.txt")
resource_file_content = get_file_content("template_r.txt")
init_file_content = get_file_content("template_i.txt")


def get_column_arguments(field, ctype, pargs, fnull, fkey, fdefault, fextra):
    global pk_field
    arguments = []
    arguments.append(
        (("%s" % ctype) if not pargs else ("%s(%s)" % (ctype, pargs)))
    )
    if fkey == "PRI":
        pk_field = field
        arguments.append("primary_key=True")
    if ctype in dict.fromkeys(as_string):
        arguments.append("as_string=True")
    arguments.append('info=get_info("%s")' % field)
    return ", ".join(arguments)


class Models(Resource):
    """ Generates model from table """

    def get(self, table_name):
        if base.environment != "dev":
            return base.build_error_response(403)
        global pk_field
        files_created = []

        #: Files path
        root_dir = os.path.join(app.root_path, "../")
        models_dir = os.path.join(root_dir, "models")
        schemas_dir = os.path.join(root_dir, "schemas")
        file_name = (
            "_".join(table_name.split("_")[1::])
            if len(table_name.split("_")) > 1
            else table_name
        )
        model_file = os.path.join(models_dir, "%s.py" % file_name)
        schema_file = os.path.join(schemas_dir, "%s.py" % file_name)
        #: Generate name of the classes
        class_name = "".join(
            x for x in file_name.title() if not x.isspace()
        ).replace("_", "")
        model_class_name = "%sModel" % class_name
        schema_class_name = "%sSchema" % class_name
        #: Build config
        qry = "DESCRIBE {table_name}".format(table_name=table_name)
        sql_dialects = []  #: MySQL data types
        ma_cols = []  #: Marshmallow columns
        model_cols = []  #: Model columns
        try:
            qry_result = db.session.execute(qry)
            for field, ftype, fnull, fkey, fdefault, fextra in qry_result:
                #: Ignore default fields
                if field in dict.fromkeys(default_fields):
                    continue
                #: Build columns for model and marshmallow schema
                ctype = ftype.strip().upper()
                ctype_args = re.search(r"\((.*?)\)", ctype)
                if ctype_args:
                    ctype_args = ctype_args.group(1)
                ctype = ctype.split("(")[0].strip()
                if ctype in dict.fromkeys(mysql_dialects) or ctype == "INT":
                    if ctype == "INT":
                        ctype = "INTEGER"
                    sql_dialects.append(ctype)
                    ma_cols.append(
                        '        "{field}": dict(required=True),'.format(
                            field=field
                        )
                    )
                    __txt = "    {field} = Column(\n        {col_args}\n    )"
                    model_cols.append(
                        __txt.format(
                            field=field,
                            col_args=get_column_arguments(
                                field,
                                ctype,
                                ctype_args,
                                fnull,
                                fkey,
                                fdefault,
                                fextra,
                            ),
                        )
                    )
                else:
                    continue

            #: Write model file
            with open(model_file, "w+") as file:
                file.write(
                    model_file_content.format(
                        sql_dialects=", ".join(
                            list(dict.fromkeys(sql_dialects))
                        ),
                        model_class_name=model_class_name,
                        ma_cols="\n".join(list(dict.fromkeys(ma_cols))),
                        table_name=table_name,
                        model_cols="\n".join(list(dict.fromkeys(model_cols))),
                        file_name=file_name,
                    )
                )
            files_created.append(model_file)

            #: Write schema file
            with open(schema_file, "w+") as file:
                file.write(
                    schema_file_content.format(
                        file_name=file_name,
                        model_class_name=model_class_name,
                        schema_class_name=schema_class_name,
                        pk_field=pk_field,
                    )
                )
            files_created.append(schema_file)
        except Exception as e:
            return base.build_error_response(500, message=str(e))
        return base.build_success_response(
            200, {"files_created": files_created}
        )


class Resources(Resource):
    def get(self, table_name):
        if base.environment != "dev":
            return base.build_error_response(403)
        global pk_field
        files_created = []
        try:
            file_name = (
                "_".join(table_name.split("_")[1::])
                if len(table_name.split("_")) > 1
                else table_name
            )

            #: Set path dirs
            root_dir = os.path.join(app.root_path, "../")
            resources_dir = os.path.join(root_dir, "resources/%s" % file_name)
            schemas_dir = os.path.join(root_dir, "schemas")
            models_dir = os.path.join(root_dir, "models")
            if not os.path.isdir(resources_dir):
                os.mkdir(resources_dir)

            #: Set files' path
            resources_file = os.path.join(resources_dir, "%s.py" % file_name)
            init_file = os.path.join(resources_dir, "__init__.py")
            schema_file = os.path.join(schemas_dir, "%s.py" % file_name)
            model_file = os.path.join(models_dir, "%s.py" % file_name)

            rst, _ = Models().get(table_name)
            files_created.extend(rst["data"]["files_created"])
            #: Generate name class
            class_name = "".join(
                x for x in file_name.title() if not x.isspace()
            ).replace("_", "")

            #: Write __init__ file
            with open(init_file, "w+") as file:
                file.write(
                    init_file_content.format(
                        file_name=file_name, class_name=class_name
                    )
                )
            files_created.append(init_file)

            #: Write resource file
            with open(resources_file, "w+") as file:
                file.write(
                    resource_file_content.format(
                        pk_field=pk_field,
                        file_name=file_name,
                        class_name=class_name,
                    )
                )
            files_created.append(resources_file)
        except Exception as e:
            return base.build_error_response(500, message=str(e))
        return base.build_success_response(
            200, {"files_created": files_created}
        )
