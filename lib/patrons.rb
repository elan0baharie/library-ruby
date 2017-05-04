class Patrons
  attr_accessor(:id, :name)

  def initialize(attribute)
    @id = attribute.fetch(:id)
    @name = attribute.fetch(:name)

  end

  def ==(other_patron)
    (self.id().==(other_patron.id())) && (self.name().==(other_patron.name()))
  end


  def self.all
    all_patrons = DB.exec("SELECT * FROM patrons;")
    saved_patrons =[]
    all_patrons.each() do |patron|
      id = patron.fetch("id").to_i
      name = patron.fetch("name")
      saved_patrons.push(Patrons.new({:id => id, :name => name}))
    end
    saved_patrons
  end

  def save
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.find(id)
    found_patron = nil
    Patrons.all().each() do |patron|
      if patron.id() == id
      found_patron = patron
      end
    end
    found_patron
  end

  def book
    saved_book = []
    books = DB.exec("SELECT * FROM books WHERE patron_id = #{self.id()};")
    books.each() do |book|
      id = book.fetch('id').to_i()
      title = book.fetch('title')
      author = book.fetch('author')
      patron_id = book.fetch('patron_id').to_i()
      saved_book.push(Books.new({:id => id, :title => title, :author => author, :patron_id => patron_id}))
    end
    saved_book
  end

end
