require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'

# Manage file data
module FileManager
  def load_book
    return unless File.exist?('../json/books.json') && !File.zero?('../json/books.json')

    book_data = JSON.parse(File.read('../json/books.json'))
    book_data.each do |book|
      @book_shelf << Book.new(book['title'], book['author'])
    end
  end

  def load_person
    return unless File.exist?('../json/person.json') && !File.zero?('../json/person.json')

    person_data = JSON.parse(File.read('../json/person.json'))
    person_data.each do |person|
      if person['type'] == 'student'
        puts person['age']
        @persons << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      elsif person['type'] == 'teacher'
        @persons << Teacher.new(person['age'], person['specialization'], person['name'])
      end
    end
  end

  def load_rentals
    return unless File.exist?('../json/rentals.json') && !File.zero?('../json/rentals.json')

    rentals_data = JSON.parse(File.read('../json/rentals.json'))
    rentals_data.each do |rental|
      book = @book_shelf.find { |each_book| each_book.title == rental['book'] }
      person = @persons.find { |each_person| each_person.name == rental['person'] }
      @rentals << Rental.new(rental['date'], book, person) if book && person
    end
  end
end

class App
  include FileManager
  def initialize
    @book_shelf = []
    @persons = []
    @rentals = []
  end

  def start_app
    puts 'Welcome to OOP University Library App!'
    load_book
    load_person
    load_rentals

    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank you for visiting our University Library!'
        break
      end
      option(input)
    end
  end

  def create_book
    puts 'Add a new book'
    puts 'Enter title: '
    title = gets.chomp
    puts 'Enter author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book_shelf << book
    File.write('../json/books.json', JSON.pretty_generate(@book_shelf.map(&:to_hash)))
    puts "#{title} has been successfully added to the book shelf."
  end

  def list_all_book
    # puts @book_shelf
    puts 'No book in the libary! Please enter 1 to add a book.' if @book_shelf.empty?
    @book_shelf.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def create_person
    puts 'Enter 1 to add a student or 2 to add a teacher or 7 to go back : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    when '7'
      start_app
    else
      puts 'Invalid input!. Try again'
      create_person
    end
  end

  def create_student
    puts 'Add a new student'
    print 'Enter name: '
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [y/n]: '
    parent_permission = gets.chomp.downcase
    until %w[n y].include?(parent_permission)
      puts 'Enter y for yes and n for no'
      print 'Has parent permission? [y/n]: '
      parent_permission = gets.chomp.downcase
    end
    student = Student.new(age, name, parent_permission: parent_permission)
    @persons << student
    case parent_permission
    when 'n'
      puts 'Student doesn\'t have parent permission, and can\'t rent book'
    when 'y'
      puts 'Student added successfully'
    end
    File.write('../json/person.json', JSON.pretty_generate(@persons.map(&:to_hash)))
  end

  def create_teacher
    puts 'Add a teacher'
    print 'Enter name: '
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    File.write('../json/person.json', JSON.pretty_generate(@persons.map(&:to_hash)))
    puts 'Teacher added successfully'
  end

  def list_all_persons
    puts 'No one in the libray list! Add a person.' if @persons.empty?
    @persons.each do |person|
      puts person.name
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id},  Age: #{person.age}"
    end
  end

  # rental
  def create_rental
    puts 'Select the book you want to rent by entering its number'
    @book_shelf.each_with_index { |book, index| puts "(#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i
    puts 'Select a person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "(#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    puts 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, @book_shelf[book_id], @persons[person_id])
    @rentals << rental
    File.write('../json/rentals.json', JSON.pretty_generate(@rentals.map(&:to_hash)))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'To see rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts 'No match found for the given ID'
      end
    end
  end
end
