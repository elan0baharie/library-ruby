require('spec_helper')


describe(Books) do
  describe("#title") do
    it ('returns the title of the book') do
      test_book = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :patron_id => nil})
      expect(test_book.title()).to(eq("Sherlock Holmes"))
    end
  end

  describe("#save") do
    it("adds a books to a catalog of saved books") do
      test_book = Books.new({:id => "nil", :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :patron_id => 0})
      test_book.save()
      expect(Books.all()).to(eq([test_book]))
    end
  end

  describe(".all") do
    it("will be empty until added to") do
      Books.all()
      expect(Books.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("it is the same entry if all properties match") do
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :patron_id => 0})
      test_book2 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :patron_id => 0})
      expect(test_book1).to(eq(test_book2))
    end
  end

  describe(".find") do
    it("returns a book by its id number ") do
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :patron_id => 0})
      test_book2 = Books.new({:id => nil, :title => "Where the Wild Things Are", :author => "Maurice Sendak", :patron_id => nil})
      expect(Books.find(test_book1.id())).to(eq(test_book1.id()))
    end
  end

  describe("#update") do
    it("adds a new book to the catalog") do
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :patron_id => 0})
      test_book1.save()
      test_book1.update({:id => nil, :title => "The Hound of Baskerville", :author => "Sir Arthur Conan Doyle", :patron_id => 0})
      expect(test_book1.title()).to(eq("The Hound of Baskerville"))
    end
  end

end
