require_relative '../classes/capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe 'test the correct_name method to return a capitalize name' do
    it 'should return a capitalized name' do
      allow(nameable).to receive(:correct_name) { 'seun joy' }
      expect(subject.correct_name).to eq('Seun joy')
    end
  end
end
