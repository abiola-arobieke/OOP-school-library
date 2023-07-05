require './classes/person'

# Define a sub-base class
class Teacher < Person
  def initialize(specialization, age)
    super(age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  attr_reader :specialization
end
