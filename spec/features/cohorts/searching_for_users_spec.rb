require "rails_helper"

RSpec.feature "Searching for Geniuses" do
  before do
    @john = User.create(first_name: "John",
                         last_name: "Doe",
                         email: "john@hgs.hiddengeniusproject.org",
                         password: "password", city: "Oakland", cohort: "0", cell: "510 777-9311")

    @sarah = User.create(first_name: "Sarah",
                          last_name: "Doe",
                          email: "sarah@hgs.hiddengeniusproject.org",
                          password: "password", city: "Oakland", cohort: "0", cell: "510 777-9311")
  end

  scenario "with existing name returns all those Geniuses" do
    visit '/'

    fill_in "search_4genius", with: "Doe"
    click_button "Search"


    expect(cohort.to_i)
    expect(cell.to_i)
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(current_path).to eq("/classrooms/search")
  end

end
