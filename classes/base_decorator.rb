require './classes/Nameable'

# Add the base class for the decorator
class BaseDecorator < Nameable
  attr_accessor :nameable
  super()

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name(_nameable)
    @nameable.correct_name
  end
end
