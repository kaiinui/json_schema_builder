class JSONSchemaBuilder
  class << self
    def build_from_schema(schema)
      json = {}
      json["$schema"] = "http://json-schema.org/draft-04/hyper-schema"
      json[:definitions] = {}
      schema.models.each do |model|
        json[:definitions][model.name] = {
            "$schema" => "http://json-schema.org/draft-04/hyper-schema",
            description: "Is a #{model.name}.",
            id: "#{schema.app_name}/#{model.name}",
            title: "#{model.name}",
            type: ["object"],
            definitions: model.properties.map do |property|
              {property.name => property.options}
            end
        }
      end

      json
    end
  end
end