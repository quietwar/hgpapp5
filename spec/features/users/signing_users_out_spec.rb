require "rails_helper"

RSpec.feature "Signing users out" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@hgs.hiddengeniusproject.org",
                         password: "password", cohort_id: 3, cell: (5107779311), city: "Oakland")

    visit '/'

    click_link "Tap in"
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    fill_in "Cohort", with: 3
    fill_in "City",  with: "Oakland"
    fill_in "Cell",  with: (5107779311)
    click_button "Log in"
  end

  scenario do
    visit "/"

    click_link "Tap out"

    expect(page).to have_content("Peace")
  end
end
