require_relative '../classes/base_decorator'

# Basedecorator tests
RSpec.describe BaseDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe 'check if the correct_name method is working correctly' do
    it 'should assign the correct_name method to the nameable object' do
      allow(nameable).to receive(:correct_name) { 'Mary Ann' }
      expect(subject.correct_name).to eq('Mary Ann')
    end
  end
end
