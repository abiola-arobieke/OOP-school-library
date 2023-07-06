# Define class Book
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_book_rental(book)
    @rentals.push(book)
  end
end
