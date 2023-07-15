require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/rental'

RSpec.describe Rental do
  book = Book.new('The Foxes', 'Paul')
  person = Person.new('Mark Anthony', 18)
  date = '23-04-2023'
  rental = Rental.new(date, book, person)

  describe 'test rental class constructor' do
    it 'should create a rental with date, book, and person' do
      expect(person.rentals).to contain_exactly(rental)
      expect(book.rentals).to contain_exactly(rental)
    end
  end

  describe '#test if the to_hash method is working correctly' do
    it 'should return a hash representation' do
      expected_hash = {
        date: date.to_s,
        book: book.title,
        person: person.name
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end
