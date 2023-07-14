require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'test if the student class is working correctly' do
    it 'should create a student with the correct name and age' do
      student = Student.new(12, 'Yush bichi')
      expect(student.name).to eq('Yush bichi')
      expect(student.age).to eq(12)
    end
  end

  context 'test if the classroom method is working correctly' do
    it "should add the student's classroom" do
      student = Student.new(14, 'Seun Abayomi')
      classroom = Classroom.new('Biology')

      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end
  end
end
