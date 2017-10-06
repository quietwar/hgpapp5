require "rails_helper"

RSpec.feature "Creating project" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@hgs.hiddengeniusproject.org", password: "password", cohort: 5, city: "Oakland", cell: "510 777-9311")
    login_as(@john)

    visit "/"

    click_link "My Lab"
    click_link "New App"
    expect(page).to have_link("Back")
  end

  scenario "with valid inputs" do
    fill_in "Coding", with: "Primary Language"
    fill_in "Project Details",  with: "Description"
    fill_in "Start date",  with: "2017-08-26"
    click_button "Create project"

    expect(page).to have_content("Project has been created")

    project = project.last
    expect(current_path).to eq(user_project_path(@john, project))
    expect(project.user_id).to eq(@john.id)
  end

  scenario "with invalid inputs" do
    fill_in "Coding", with: "Primary Language"
    fill_in "Project Details",  with: "Description"
    fill_in "Start date",  with: "08-26-2017"
    click_button "Create project"

    expect(cohort.to_i).to eql model.id
    expect(cell.to_i).to eql model.id
    expect(page).to have_content("Project has not been created")
    expect(page).to have_content("Coding has to have a language")
    expect(page).to have_content("Project details can't be blank")
    expect(page).to have_content("Start date can't be empty")
  end

end
