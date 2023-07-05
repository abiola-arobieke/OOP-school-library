require './classes/base_decorator'

# Class for capitalizing name
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
