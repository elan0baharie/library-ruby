require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/books')
require('./lib/authors')
require('./lib/checkout_titles')
require('./lib/patrons')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'library_test'})

get('/') do
  erb(:index)
end

get('/books') do
  @books = Books.all()
  erb(:books)
end

get('/books/new') do
  @books = Books.all()
  erb(:books)
end

post('/books') do
  title = params.fetch('title')
  author = params.fetch('author')
  new_book = Books.new({:id => nil, :title => title, :author => author, :patron_id => 0})
  new_book.save()
  erb(:index)
end

get('/patrons') do
  @patrons = Patrons.all()
  erb(:patrons)
end

get('/patrons/new') do
  @patrons = Patrons.all()
  erb(:patrons)
end

post('/patrons') do
  name = params.fetch('name')
  new_patron = Patrons.new({:id => nil, :name => name})
  new_patron.save()
  erb(:index)
end

get('/checkout') do
  @checkout = Checkout_Titles.all()
  @patrons = Patrons.all()
  @books = Books.all()
  erb(:checkout)
end

post('/checkout') do
  patron_id = params.fetch("patron_id")
  book_id = params.fetch("book_id")
  checkout = Checkout_Titles.new({:patron_id => patron_id, :book_id => book_id})
  checkout.save()
  erb(:index)
end

get('/checkout_form') do
  @checkouts = Checkout_Titles.all()
  erb(:checkout_form)
end
