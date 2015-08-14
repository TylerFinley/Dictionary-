require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the definition path', {:type => :feature}) do
  it('processes the user entry and returns the word') do
    visit('/')
    click_link('Add New Word')
    fill_in('definition', :with => 'winter')
    click_button('Add Word')
    expect(page).to have_content('winter')
  end
end
