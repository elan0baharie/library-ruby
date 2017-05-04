require('spec_helper')

describe(Patrons) do
  describe("#name") do
    it("will return the selected patron's name")do
    test_patron = Patrons.new({:id => nil, :name => "Bob", :book_id => [1]})
    expect(test_patron.name()).to(eq("Bob"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_patron1 = Patrons.new({:id => nil, :name => "Bob", :book_id => 1})
      test_patron1.save()
      expect(test_patron1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same patron if it has the same info") do
      test_patron1 = Patrons.new({:id => nil, :name => "Bob", :book_id => [1]})
      test_patron2 = Patrons.new({:id => nil, :name => "Bob", :book_id => [1]})
      expect(test_patron1).to(eq(test_patron2))
    end
  end

  describe(".all") do
    it("will be empty till patrons are added to the list") do
      expect(Patrons.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("will find a new patron by its id") do
      test_patron = Patrons.new({:id => nil, :name => "Stu", :book_id => "1"})
      expect(Patrons.find(test_patron.id())).to(eq(test_patron.id()))
    end
  end

  describe("#book") do
    it("will return all books with the patron's id") do
      test_patron = Patrons.new({:id => nil, :name => "Stu", :book_id => 1})
      test_patron.save()
      test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => test_patron.id()})
      test_book1.save()
      test_book2 = Books.new({:id => nil, :title => "Where the Wild Things Are", :author => "Maurice Sendak", :checkout_date => '2017-01-01', :patron_id => test_patron.id()})
      test_book2.save()
      expect(test_patron.book()).to(eq([test_book1, test_book2]))
    end
  end

  describe("#due_date")
  it("will return a due date for a book") do
    test_book1 = Books.new({:id => nil, :title => "Sherlock Holmes", :author => "Sir Arthur Conan Doyle", :checkout_date => '2017-01-01', :patron_id => 1})
    test_book1.save()
    expect(test_book1.due_date()).to(eq(2017-05-04))
  end
end
