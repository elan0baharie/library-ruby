require('pg')
require('date')
require('rspec')
require('books')
require('pry')
require('patrons')
require('checkout_titles')
require('authors')

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM patrons *;")
    DB.exec("DELETE FROM checkouts *;")
  end
end
