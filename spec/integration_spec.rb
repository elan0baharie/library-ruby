require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('get the checkout info to show', {:type => :feature}) do
  it('allow the user to see all of the checkout logs that have been created') do
    visit('/')
    click_link('Add a book')
    fill_in('title', :with => "Trees")
    fill_in('author', :with => "Me")
    click_button('Click')
    click_link('Add a patron')
    fill_in('name', :with => "Bobby")
    click_button('Add a patron')
    click_link('Checkout a book')
    select('Bobby', :from => 'patron_id')
    select('Trees', :from => 'book_id')
    click_button('Checkout a book')
    expect(page).to have_content("Add a book")
  end
end
