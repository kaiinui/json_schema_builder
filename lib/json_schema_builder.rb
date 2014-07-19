

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

        [
            {method: "GET", rel: "index"},
            {method: "POST", rel: "create"}
        ].each do |link|
          json[:links].push({
                                description: "#{link[:rel]} #{model.name}.",
                                href: "/#{model.plural_name}",
                                method: link[:method],
                                rel: link[:rel],
                                title: link[:rel]
          })
        end

        [
            {method: "GET", rel: "show"},
            {method: "PATCH", rel: "update"},
            {method: "DELETE", rel: "destroy"}
        ].each do |link|
          json[:links].push({
                                description: "#{link[:rel]} #{model.name}.",
                                href: "/#{model.plural_name}/{#/definitions/#{model.name}/id}",
                                method: link[:method],
                                rel: link[:rel],
                                title: link[:rel]
          })
        end
      end

      json
    end
  end
end