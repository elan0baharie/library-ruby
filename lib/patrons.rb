class Patrons
  attr_accessor(:id, :name, :book_id)

  def initialize(attribute)
    @id = attribute.fetch(:id)
    @name = attribute.fetch(:name)
    @book_id = attribute.fetch(:book_id)
  end

  def ==(other_patron)
    (self.id().==(other_patron.id())) && (self.name().==(other_patron.name())) && (self.book_id().==(other_patron.book_id()))
  end

  def self.all
    all_patrons = DB.exec("SELECT * FROM patrons;")
    saved_patrons =[]
    all_patrons.each() do |patron|
      id = patron.fetch("id").to_i
      name = patron.fetch("name")
      book_id = patron.fetch("book_id")
      saved_patrons.push(Patrons.new({:id => id, :name => name, :book_id => book_id}))
    end
    saved_patrons
  end

  def save
    result = DB.exec("INSERT INTO patrons (name, book_id) VALUES ('#{@name}', #{@book_id}) RETURNING id;")
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

end
