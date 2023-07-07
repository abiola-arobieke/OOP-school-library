# require './classes/base_decorator'
require_relative 'base_decorator'

# Name trimmer class
class TrimmerDecorator < BaseDecorator
  MAX_LENGTH = 10

  def correct_name
    if @nameable.correct_name.length <= MAX_LENGTH
      @nameable.correct_name
    else
      @nameable.correct_name[0...MAX_LENGTH]
    end
  end
end
