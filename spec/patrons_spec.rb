require('spec_helper')

describe(Patrons) do
  describe("#name") do
    it("will return the selected patron's name")do
    test_patron = Patrons.new({:id => nil, :name => "Bob", :book_id => [1]})
    expect(test_patron.name()).to(eq("Bob"))
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

end
