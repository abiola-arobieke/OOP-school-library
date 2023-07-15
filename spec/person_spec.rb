require_relative '../classes/person'
require_relative '../classes/book'
require_relative '../classes/rental'

describe Person do
  name = 'Sean Paul'

  context 'checks if the method can_use_services is working correctly' do
    it 'should return true if age => 18 and parent_permission is true' do
      age = 18
      parent_permission = true

      person = Person.new(age, name, parent_permission: parent_permission)
      expect(person.can_use_services).to be(true)
    end

    it 'should return false if age < 18 and permission is false' do
      age = 12
      parent_permission = false

      person = Person.new(age, name, parent_permission: parent_permission)
      expect(person.can_use_services).to be(false)
    end

    it 'should return true if age > 18 and parent_permission is true' do
      age = 18
      parent_permission = false

      person = Person.new(age, name, parent_permission: parent_permission)
      expect(person.can_use_services).to be(true)
    end
  end

  context 'check if correct_name method is working correctly' do
    it "should return the person's name" do
      person = Person.new(32, name)
      expect(person.correct_name).to eq(name)
    end
  end

  context 'should check if the add_rental method is working correctly' do
    it 'should create a new RentalBook instance' do
      age = 21
      person = Person.new(age, name)

      book = Book.new('Title', 'Author')
      rental_date = '2023-07-04'

      rental = book.add_rental(person, rental_date)

      expect(rental.date).to eq(rental_date)
      expect(rental.person).to eq(person)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
