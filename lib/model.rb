require_relative 'field'

class Model
  attr_accessor :name, :fields

  def initialize(name, &blk)
    self.name = name
    self.fields = []
    self.instance_eval &blk
  end

  def field(name, options)
    field.push Field.new(name, options)
  end
end