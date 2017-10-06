require "rails_helper"

RSpec.feature "Creating Home Page" do
  scenario do
    visit '/'

     
    expect(page).to have_link('Tap in')
    expect(page).to have_link('Genius staff sign up')
    expect(page).to have_content('The Hidden Genius Project')
    #expect(page).to have_content('Featured Geniuses')
  end
end
