class JSONSchemaBuilder
  class << self
    def build_from_schema(schema)
      json = {}
      json[:models] = schema.models.map do |model|
        {
            name: model.name, # TODO: Refactor to to_json
            properties: model.properties.map do |property|
              {property.name => property.options}
            end
        }
      end

      json
    end
  end
end