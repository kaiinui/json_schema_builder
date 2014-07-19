require_relative 'property'
require 'active_support/core_ext/string'

class Model
  attr_accessor :name, :properties

  def initialize(name, &blk)
    self.name = name
    self.properties = []
    self.instance_eval &blk
  end

  def property(name, options)
    properties.push Property.new(name, options)
  end

  def plural_name
    self.name.to_s.pluralize
  end
end