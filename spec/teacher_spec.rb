require_relative '../classes/teacher'

describe Teacher do
  context 'test if the teacher class is working correctly' do
    teacher = Teacher.new(37, 'Economics', 'Yomi Gold')

    it 'should create a  teacher with his age' do
      expect(teacher.age).to eq(37)
    end

    it 'should contain the given specialization' do
      expect(teacher.specialization).to eq('Economics')
    end

    it 'should contain the given name' do
      expect(teacher.name).to eq('Yomi Gold')
    end
  end
end
