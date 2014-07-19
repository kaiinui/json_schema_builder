require 'yaml'

model = {
    name: "App",
    id: "example/app",
    type: "Object",
    required: [
        "id"
    ],
    definitions: [
        id: {
            description: "A unique id that automatically assigned by the app.", # => should be annotated
            example: "2", # => should be annotated
            format: "UUID", # => should be annotated
            readOnly: true, # => should be annotated
            type: "Integer"
        },
        name: {
            #..
        },
        hoge: {
            #..
        }
    ],
    links: [
        {
            description: "Create a new app", # => can be generated
            href: "/apps", # => can be taken from route
            method: "POST", # => can be taken from route
            rel: "create",
            schema: {
                properties: {
                    name: {
                        "$ref" => "#/definitions/app/definitions/name"
                    }
                }
            }
        },
        {
            description: "Delete an app.",
            href: "/apps",
            rel: "create"
        }
    ],
    properties: {
        id: {
            "$ref" => "#/definitions/app"
        }
    }
}