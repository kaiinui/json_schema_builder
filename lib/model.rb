require_relative 'field'

class Model
  attr_accessor :fields

  def initialize
    self.fields = []
  end

  def field(name, options)
    field.push Field.new(name, options)
  end
end