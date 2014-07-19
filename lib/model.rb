require_relative 'property'

class Model
  attr_accessor :name, :properties

  def initialize(name, &blk)
    self.name = name
    self.properties = []
    self.instance_eval &blk
  end

  def property(name, *options)
    properties.push Property.new(name, options)
  end
end