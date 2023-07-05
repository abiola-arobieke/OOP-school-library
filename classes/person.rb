require './classes/nameable'

# Inherit the person from the nameable class
class Person < Nameable
  # accessor get methods
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # accessor set methods
  def of_age
    @age >= 18
  end

  private :of_age

  def can_use_services
    of_age || @parent_permission
  end

  def correct_name
    @name
  end
end