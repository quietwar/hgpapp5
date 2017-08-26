require "rails_helper"

RSpec.feature "Users signin" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@hgs.hiddengeniusproject.org",
                         password: "password")
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Tap in"
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    click_button "Log in"

    expect(page).to have_content("Welcome Genius! You're good")
    expect(page).to have_content("Signed in as #{@john.email}")
  end
end
