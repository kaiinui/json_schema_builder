json_schema_builder
===================

A DSL to build JSON Schema

```ruby
app :my_app
base "http://example.com/api"

model :app do
  property :id, description: "An id", example: "1", format: "UUID", read_only: "true", type: "String"
  property :name, description: "name", example: "my app", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
end

model :recipe do
  property :id, description: "id", example: "1", format: "UUID", read_only: "true", type: "String"
  property :name, description: "name", example: "potato chips", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
end
```
