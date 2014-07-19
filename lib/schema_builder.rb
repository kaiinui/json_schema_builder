require_relative 'model'

class SchemaBuilder
  attr_accessor :app_name, :models

  class << self
    def build(&blk)
      @instance = new
      @instance.instance_eval &blk
      @instance
    end
  end

  def initialize
    self.models = []
  end

  def model(name, &blk)
    models.push Model.new(name, &blk)
  end

  def app(name)
    self.app_name = name
  end
end