# # require './classes/person'
require_relative 'person'

# Define a sub-base class
class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end


# require_relative 'person'

# class Student < Person
#   attr_reader :classroom

#   def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
#     super(name: name, age: age, parent_permission: parent_permission)
#     @classroom = classroom
#   end

#   def classroom=(classroom)
#     @classroom = classroom
#     classroom.students.push(self)
#   end

#   def play_hooky
#     '¯\(ツ)/¯'
#   end
# end