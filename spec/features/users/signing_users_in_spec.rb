require "rails_helper"

RSpec.feature "Users signin" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@hgs.hiddengeniusproject.org",
                         password: "password", cohort_id: 0, cell: (5107779311), city: "Oakland")
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Tap in"
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    fill_in "cohort", with: 0
    fill_in "city", with: "Oakland"
    fill_in "cell", with: (5107779311)
    click_button "Log in"

    expect(page).to have_content("Welcome Genius! You're good")
    expect(page).to have_content("Signed in as #{@john.first_name}")
  end
end
