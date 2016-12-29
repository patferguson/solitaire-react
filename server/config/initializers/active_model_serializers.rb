# "By default ActiveModelSerializers will use the Attributes Adapter (no JSON root). But we strongly advise you to use JsonApi Adapter, which follows 1.0 of the format specified in jsonapi.org/format."
# See: https://github.com/rails-api/active_model_serializers/

ActiveModelSerializers.config.adapter = :json_api
