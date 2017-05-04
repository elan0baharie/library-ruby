class Books
  attr_accessor(:id, :title, :author, :patron_id)

  define_method(:initialize) do |attribute|
    @id = attribute.fetch(:id)
    @title = attribute.fetch(:title)
    @author = attribute.fetch(:author)
    @patron_id = attribute.fetch(:patron_id)
  end

  def ==(another_book)
    (self.id() == another_book.id()) && (self.title() == another_book.title()) && (self.author() == another_book.author()) && (self.patron_id() == another_book.patron_id())
  end

  def self.all
    all_books = DB.exec("SELECT * FROM books;")
    saved_books = []
    all_books.each() do |book|
      id = book.fetch("id").to_i()
      title = book.fetch("title")
      author = book.fetch("author")
      patron_id = book.fetch("patron_id").to_i
      saved_books.push(Books.new({:id => id, :title => title, :author => author, :patron_id => patron_id}))
    end
    saved_books
  end

  def save
    result = DB.exec("INSERT INTO books (title, author, patron_id) VALUES ('#{@title}', '#{@author}', #{@patron_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.find(id)
    found_book = nil
    Books.all().each() do |book|
      if book.id() == id
        found_book = book
      end
    end
    found_book
  end

  def update(attribute)
    @title = attribute.fetch(:title)
    @author = attribute.fetch(:author)
    @patron_id = attribute.fetch(:patron_id)
    @id = self.id()
    DB.exec("UPDATE books SET title = '#{@title}', author = '#{@author}', patron_id = #{@patron_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM books WHERE id= #{self.id()};")
  end

end
