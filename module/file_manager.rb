# Manage file data
module FileManager
  def load_book
    return unless File.exist?('../json/books.json') && !File.empty?('../json/books.json')

    book_data = JSON.parse(File.read('../json/books.json'))
    book_data.each do |book|
      @book_shelf << Book.new(book['title'], book['author'])
    end
  end

  def load_person
    return unless File.exist?('../json/person.json') && !File.empty?('../json/person.json')

    person_data = JSON.parse(File.read('../json/person.json'))
    person_data.each do |person|
      if person['type'] == 'student'
        @persons << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      elsif person['type'] == 'teacher'
        @persons << Teacher.new(person['age'], person['specialization'], person['name'])
      end
    end
  end

  def load_rentals
    return unless File.exist?('../json/rentals.json') && !File.empty?('../json/rentals.json')

    rentals_data = JSON.parse(File.read('../json/rentals.json'))
    rentals_data.each do |rental|
      book = @book_shelf.find { |each_book| each_book.title == rental['book'] }
      person = @persons.find { |each_person| each_person.name == rental['person'] }
      @rentals << Rental.new(rental['date'], book, person) if book && person
    end
  end
end
