require './classes/Nameable'

class BaseDecorator < Nameable
    attr_accessor :nameable

    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name(nameable)
        @nameable.correct_name
    end
end