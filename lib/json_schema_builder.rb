class JSONSchemaBuilder
  class << self
    def build_from_schema(schema)
      json = {}
      json[:models] = schema.models.map do |model|
        json_model = {
            name: model.name, # TODO: Refactor to to_json
            properties: []
        }
        model.properties.each do |property|
          json_property = {}
          json_property[:name] = property.name
          json_model[:properties].push(json_property)
        end

        json_model
      end

      json
    end
  end
end