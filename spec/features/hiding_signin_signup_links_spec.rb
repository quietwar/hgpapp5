require "rails_helper"

RSpec.feature "Hiding signin link" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@hiddengeniusproject.org",
                         password: "password", city: "Oakland", cohort: "0", cell: "510 777-9311")
  end

  scenario "upon successful signin" do
    visit "/"

    click_link "sign_in"
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    fill_in "City", with: "Oakland"
    fill_in "Cohort", with: 0
    fill_in "Cell", with: "510 777-9311"

    click_button "Tap in"

    expect(cohort.to_i)
    expect(cell.to_i)
    expect(page).to have_link("Tap out")
    expect(page).to have_link("My Lab")
    expect(page).not_to have_link("Tap in")
    expect(page).not_to have_link("Google Tap in")
    expect(page).not_to have_link("Genius Sign up")
  end
end
