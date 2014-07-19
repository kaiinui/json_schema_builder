require 'pp'
require_relative 'lib/schema_builder'
require_relative 'lib/json_schema_builder'

schema = SchemaBuilder.build do
  app :my_app
  description "An example app."
  model :app do
    property :id, description: "some description", example: "1", format: "UUID", read_only: "true", type: "String"
    property :name, description: "some description", example: "1", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
  end
end

pp JSONSchemaBuilder.build_from_schema(schema)