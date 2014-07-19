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
            required: [
                "id"
            ],
            definitions: model.properties.map do |property|
              {property.name => property.options}
            end
        }
        json[:links] = []
        ["GET", "POST"].each do |method|
          json[:links].push({
            description: "Some description.", # [MOCK]
            href: "/#{model.plural_name}",
            method: method,
            rel: "some_rel", # [MOCK]
            title: "some_title" # [MOCK]
          })
        end
        ["GET", "PATCH", "DELETE"].each do |method|
          json[:links].push({
            description: "Some description.", # [MOCK]
            href: "/#{model.plural_name}/{#/definitions/#{model.name}/id}",
            method: method,
            rel: "some_rel",
            title: "some_title"
          })
        end
      end

      json
    end
  end
end