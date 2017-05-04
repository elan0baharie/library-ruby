class Checkout_Titles

  attr_accessor(:id, :patron_id, :book_id, :checkout_date, :due_date)

  define_method(:initialize) do |attribute|
    @id = attribute.fetch(:id)
    @patron_id = attribute.fetch(:patron_id)
    @book_id = attribute.fetch(:book_id)
    @checkout_date = attribute.fetch(:checkout_date)
    @due_date = attribute.fetch(:due_date)
  end

  def ==(another_checkout)
    (self.id() == another_checkout.id()) && (self.patron_id() == another_checkout.patron_id()) && (self.book_id() == another_checkout.book_id()) && (self.checkout_date() == another_checkout.checkout_date()) && (self.due_date() == another_checkout.due_date())
  end

  def self.all
    all_checkouts = DB.exec("SELECT * FROM checkouts;")
    saved_checkouts = []
    all_checkouts.each() do |checkout|
      id = checkout.fetch("id").to_i()
      patron_id = checkout.fetch("patron_id").to_i()
      book_id = checkout.fetch("book_id").to_i()
      checkout_date = checkout.fetch("checkout_date")
      due_date = checkout.fetch("due_date")
      saved_checkouts.push(Checkout_Titles.new({:id => id, :patron_id => patron_id, :book_id => book_id, :checkout_date => checkout_date, :due_date => due_date}))
    end
    saved_checkouts
  end

  def save
    result = DB.exec("INSERT INTO checkouts (patron_id, book_id, checkout_date) VALUES (#{@patron_id}, #{@book_id}, '#{@checkout_date}', '#{@due_date}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.find(id)
    found_checkout = nil
    Checkout_Titles.all().each() do |checkout|
      if checkout.id() == id
        found_checkout = checkout
      end
    end
    found_checkout
  end

end
