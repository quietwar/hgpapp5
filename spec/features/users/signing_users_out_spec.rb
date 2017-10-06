require "rails_helper"

RSpec.feature "Signing users out" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@hgs.hiddengeniusproject.org",
                         password: "password", city: "Oakland", cohort: 3, cell: "510 777-9311")

    visit '/'

    click_link "Tap in"
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    fill_in "Cohort", with: 3
    fill_in "City",  with: "Oakland"
    fill_in "Cell",  with: "510 777-9311"
    click_button "Log in"
  end

  scenario do
    visit "/"

    click_link "Tap out"

    expect(cohort.to_i)
    expect(cell.to_i)
    expect(page).to have_content("Peace.")
  end
end
