require('spec_helper')

describe(Checkout_Titles) do

  describe("#patron_id") do
    it("will return the desired patron id for the checkout record") do
      test_checkout = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-26"})
      expect(test_checkout.patron_id()).to(eq(1))
    end
  end

  describe("#checkout_date") do
    it("will return the desired patron id for the checkout record") do
      test_checkout = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-26"})
      expect(test_checkout.checkout_date()).to(eq("2015-02-12"))
    end
  end

  describe("#save") do
    it("will save a checkout record") do
      test_checkout = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-12"})
      test_checkout.save()
      expect(test_checkout.checkout_date()).to(eq("2017-05-04"))
    end
  end

  describe("#due_date") do
    it("will return the due date for the checkout log") do
      test_checkout = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-12"})
      test_checkout.save()
      expect(test_checkout.due_date()).to(eq("2017-05-18"))
    end
  end

  describe("#==") do
    it ("will compare and find if it's the same") do
      test_checkout1 = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-26"})
      test_checkout2 = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-26"})
      expect(test_checkout1).to(eq(test_checkout2))
    end
  end

  # describe("#checkout_date_maker") do
  #   it ("will clear old checkout date and make a new one") do
  #     test_checkout1 =  Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => "2015-02-12", :due_date => "2015-02-26"})
  #     test_checkout1.save()
  #     test_checkout1.checkout_date_maker()
  #     print test_checkout1.checkout_date()
  #     expect(test_checkout1.checkout_date()).to(eq(Date))
  #   end
  # end

  # describe("#due_date") do
  # it("will return a due date for a book") do
  #   test_checkout = Checkout_Titles.new({:id => nil, :patron_id => 1, :book_id => 3, :checkout_date => nil, :due_date => nil})
  #
  #   expect(test_checkout.due_date()).to(eq(2017-05-04))
  # end
end
