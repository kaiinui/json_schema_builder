require_relative 'lib/schema_builder'

schema = SchemaBuilder.build do
  model :app do
    property :id, description: "some description", example: "1", format: "UUID", read_only: "true", type: "String"
    property :name, description: "some description", example: "1", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
  end
end

puts schema.models[0].properties[0].options