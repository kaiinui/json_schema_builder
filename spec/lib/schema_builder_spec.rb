require_relative '../../spec/spec_helper'

describe SchemaBuilder do
  context '#build' do
    let(:schema) do
      SchemaBuilder.build do
        app :example_app
        model :app do
          property :id, description: "some description", example: "1", format: "UUID", read_only: "true", type: "String"
          property :name, description: "some description", example: "1", pattern: "^[a-z][a-z0-9-]{3,50}$", read_only: "true", type: "String"
        end
      end
    end

    it { expect(schema.app_name).to eq :example_app }

    let(:model_app) { schema.models.first }

    it { expect(model_app.properties.size).to eq 2 }
    it { expect(model_app.properties.first.name).to eq :id }
  end
end