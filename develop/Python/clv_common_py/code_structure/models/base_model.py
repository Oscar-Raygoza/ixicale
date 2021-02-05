from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy import Column
from sqlalchemy.dialects.mysql import VARCHAR, TINYINT, DATETIME
from datetime import datetime

__all__ = ["BaseModel"]
DATETIME_FORMAT = "%Y-%m-%d %H:%M:%S"


#: Marshmallow Rules
def get_info(column):
    cols = {
        "estado": dict(default=1, missing=1),
        "usuario_creacion": dict(required=True),
        "fecha_creacion": dict(
            # required=True,
            as_string=True,
            missing=lambda: datetime.now().strftime(DATETIME_FORMAT),
            format="%Y-%m-%d %H:%M:%S",
        ),
        "usuario_ultima_modificacion": dict(required=True),
        "fecha_ultima_modificacion": dict(
            # required=True,
            as_string=True,
            missing=lambda: datetime.now().strftime(DATETIME_FORMAT),
            format="%Y-%m-%d %H:%M:%S",
        ),
    }
    return dict(marshmallow=cols[column])


class BaseModel(object):
    """ Common columns in all models """

    @declared_attr
    def __tablename__(cls):
        return cls.__name__.lower()

    estado = Column(TINYINT(4), info=get_info("estado"))
    usuario_creacion = Column(VARCHAR(45), info=get_info("usuario_creacion"))
    fecha_creacion = Column(DATETIME, info=get_info("fecha_creacion"))
    usuario_ultima_modificacion = Column(
        VARCHAR(45),
        default=datetime.utcnow,
        info=get_info("usuario_ultima_modificacion"),
    )
    fecha_ultima_modificacion = Column(
        DATETIME,
        default=datetime.utcnow,
        info=get_info("fecha_ultima_modificacion"),
    )
