require('spec_helper')


describe(Books) do
  describe("#title") do
    it ('returns the title of the book') do
      test_book = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => nil})
      expect(test_book.title()).to(eq("Sherlock Holmes"))
    end
  end


  describe("#save") do
    it("adds a books to a catalog of saved books") do
      test_book = Books.new({:id => "nil", :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 0})
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
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 0})
      test_book2 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 0})
      expect(test_book1).to(eq(test_book2))
    end
  end

  describe(".find") do
    it("returns a book by its id number ") do
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 0})
      test_book2 = Books.new({:id => nil, :title => "Where the Wild Things Are", :author => "Maurice Sendak", :checkout_date => '2017-01-01', :patron_id => nil})
      expect(Books.find(test_book1.id())).to(eq(test_book1.id()))
    end
  end

  describe("#update") do
    it("adds a new book to the catalog") do
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 0})
      test_book1.save()
      test_book1.update({:id => nil, :title => "The Hound of Baskerville", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 0})
      expect(test_book1.title()).to(eq("The Hound of Baskerville"))
    end
  end

  describe("#patron") do
    it("shows all books of a patron") do
      # test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => test_patron1.id()})
      # test_book1.save()
      # test_patron1 = Patrons.new({:id => nil, :name => "Bob", :book_id => 1})
      # test_patron1.save()
      # test_patron2 = Patrons.new({:id => nil, :name => "Bob", :book_id => 1})
      # test_patron2.save()
      # expect(test_book1.patron()).to(eq([test_patron1, test_patron2]))
    end
  end
end
