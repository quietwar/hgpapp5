require "rails_helper"

RSpec.feature "Searching for Geniuses" do
  before do
    @john = User.create(first_name: "John",
                         last_name: "Doe",
                         email: "john@hgs.hiddengeniusproject.org",
                         password: "password")

    @sarah = User.create(first_name: "Sarah",
                          last_name: "Doe",
                          email: "sarah@hgs.hiddengeniusproject.org",
                          password: "password")
  end

  scenario "with existing name returns all those Geniuses" do
    visit '/'

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(current_path).to eq("/classrooms/search")
  end

end
