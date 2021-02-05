from config import api
from .models import Models, Resources

api.add_resource(Models, "/v1/clever_tools/models/<string:table_name>")
api.add_resource(Resources, "/v1/clever_tools/resources/<string:table_name>")
