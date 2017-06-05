require "rails_helper"

RSpec.feature "Creating Home Page" do
  scenario do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_link('My Lab')
    expect(page).to have_content('The Hidden Genius Project')
    expect(page).to have_content('Who are the Geniuses?')
  end
end
