# Manage file data
module FileManager
  def load_book
    return unless File.exist?('../json/books.json') && !File.empty?('../json/books.json')

    book_data = JSON.parse(File.read('../json/books.json'))
    book_data.each do |book|
      @book_shelf << Book.new(book['title'], book['author'])
    end
  end

  def fetch_person_if_exist
    return unless File.exist?('../json/person.json') && !File.empty?('../json/person.json')

    JSON.parse(File.read('../json/person.json'))
  end

  def load_person
    person_data = fetch_person_if_exist
    person_data.each do |person|
      if person['type'] == 'student'
        @persons << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      elsif person['type'] == 'teacher'
        @persons << Teacher.new(person['age'], person['specialization'], person['name'])
      end
    end
  end

  def fetch_rentals_if_exist
    return unless File.exist?('../json/rentals.json') && !File.empty?('../json/rentals.json')

    JSON.parse(File.read('../json/rentals.json'))
  end

  def load_rentals
    rentals_data = fetch_rentals_if_exist
    rentals_data.each do |rental|
      book = @book_shelf.find { |each_book| each_book.title == rental['book'] }
      person = @persons.find { |each_person| each_person.name == rental['person'] }
      @rentals << Rental.new(rental['date'], book, person) if book && person
    end
  end
end
