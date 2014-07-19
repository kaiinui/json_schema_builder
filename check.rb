require_relative 'lib/schema_builder'

SchemaBuilder.build do
  model :app do
    property :id
    property :name
  end
end