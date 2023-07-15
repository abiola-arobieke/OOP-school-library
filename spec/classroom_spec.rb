require 'rspec'
require_relative '../classes/student'
require_relative '../classes/classroom'

RSpec.describe Classroom.new 'Physics' do
  label = 'Physics'
  classroom = Classroom.new(label)
  student = Student.new('Alaba Yellow')

  describe 'test if the constructor will be initailized' do
    it 'intialize the classroom label' do
      expect(classroom.label).to eq(label)
    end

    it 'test if the students will not be initialized' do
      expect(classroom.students).to be_empty
    end
  end

  describe 'the add_student method should work correctly' do
    it 'the method for adding student to an array should work correctly' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'test if the classrom is set for the student correctly' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
