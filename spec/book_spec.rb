require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/rental'

RSpec.describe Book do
  describe 'the add_rental method should work correctly' do
    person = Person.new('Bayo')
    date = '14-07-23'
    book = Book.new('Moonlight', 'Jack Bowen')

    it 'creates a new rental and adds it to the rentals array' do
      rental = book.add_rental(person, date)
      expect(rental).to be_an_instance_of(Rental)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe 'the to_hash method should create a JSON' do
    book = Book.new('Moonlight', 'Jack Bowen')

    it 'returns a hash representation of the book' do
      hash_book_array = book.to_hash
      expect(hash_book_array).to be_a(Hash)
      expect(hash_book_array).to eq({ title: 'Moonlight', author: 'Jack Bowen' })
    end
  end
end
