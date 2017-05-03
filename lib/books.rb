class Books
  attr_accessor(:id, :title, :author, :checkout_date)

  define_method(:initialize) do |attribute|
    @id = attribute.fetch(:id)
    @title = attribute.fetch(:title)
    @author = attribute.fetch(:author)
    @checkout_date = attribute.fetch(:checkout_date)
  end

  def ==(another_book)
    (self.id() == another_book.id()) && (self.title() == another_book.title()) && (self.author() == another_book.author()) && (self.checkout_date() == another_book.checkout_date())
  end

  def self.all
    all_books = DB.exec("SELECT * FROM books;")
    saved_books = []
    all_books.each() do |book|
      id = book.fetch('id').to_i()
      title = book.title('title')
      author = book.author('author')
      checkout_date = book.checkout_date('checkout_date')
      saved_books.push(Books.new({:id => id, :title => title, :author => author, :checkout_date => checkout_date}))
    end
    saved_books
  end

  def save
    result = DB.exec("INSERT INTO books (title, author, checkout_date) VALUES ('#{@title}', '#{@author}', '#{@checkout_date}');")
  end
end
