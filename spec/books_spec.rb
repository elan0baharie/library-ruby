require('spec_helper')


describe(Books) do
  describe("#title") do
    it ('returns the title of the book') do
      test_book = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01'})
      expect(test_book.title()).to(eq("Sherlock Holmes"))
    end
  end

  describe("#save") do
    it("adds a books to a catalog of saved books") do
      test_book = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01'})
      test_book.save()
      expect(Books.all()).to(eq(test_book))
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
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01'})
      test_book2 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01'})
      expect(test_book1).to(eq(test_book2))
    end
  end
end
