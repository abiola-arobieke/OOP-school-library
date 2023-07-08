# require './classes/Nameable'
require_relative 'Nameable'

# Add the base class for the decorator
class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name(_nameable)
    @nameable.correct_name
  end
end
