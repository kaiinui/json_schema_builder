require 'pp'
require_relative 'lib/schema_builder'
require_relative 'lib/json_schema_builder'

schema = SchemaBuilder.build do
  title "An example App JSON Schema."
  base "http://example.com/api"
  app :my_app
  description "An example app."

  model :app do
    property :id, description: "An id", example: "1", format: "UUID", read_only: "true", type: "String"
    property :name, description: "name", example: "my app", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
  end

  model :recipe do
    property :id, description: "id", example: "1", format: "UUID", read_only: "true", type: "String"
    property :name, description: "name", example: "potato chips", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
  end
end

pp JSONSchemaBuilder.build_from_schema(schema)