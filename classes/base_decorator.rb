# require './classes/Nameable'
require_relative 'nameable'

# Add the base class for the decorator
class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end