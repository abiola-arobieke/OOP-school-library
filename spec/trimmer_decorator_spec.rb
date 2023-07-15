require_relative '../classes/trimmer_decorator'

# trimmer_decorator tests
RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe 'check of the correct_name is working correctly' do
    context 'test when the name is longer than 10 characters' do
      it 'should trims the name down to the first 10 characters' do
        allow(nameable).to receive(:correct_name) { 'Maximilliano' }
        expect(subject.correct_name).to eq('Maximillia')
      end
    end

    context 'test when the name is not longer than 10 character' do
      it 'should return the same name' do
        allow(nameable).to receive(:correct_name) { 'Sola Ali' }
        expect(subject.correct_name).to eq('Sola Ali')
      end
    end
  end
end
