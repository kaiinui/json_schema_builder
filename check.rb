require_relative 'lib/schema_builder'
require_relative 'lib/json_schema_builder'

schema = SchemaBuilder.build do
  model :app do
    property :id, description: "some description", example: "1", format: "UUID", read_only: "true", type: "String"
    property :name, description: "some description", example: "1", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
  end
end

puts JSONSchemaBuilder.build_from_schema(schema)