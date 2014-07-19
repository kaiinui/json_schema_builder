require_relative 'lib/schema_builder'

SchemaBuilder.build do
  model :app do
    field :id, description: "some description", example: "1", format: "UUID", read_only: "true", type: "String"
    field :name, description: "some description", example: "1", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
  end
end