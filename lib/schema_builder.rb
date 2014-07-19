class SchemaBuilder
  attr_accessor :models

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

  def model(&blk)
    model = Model.new
    model.instance_eval &blk
    models.push model
  end
end