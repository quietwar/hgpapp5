require 'rails_helper'

RSpec.feature "Editing project" do
  before do
    @owner = User.create(first_name: "John", last_name: "Doe", email: "owner@hgs.hiddengeniusproject.org", password: "password", cohort: (5), city: "Oakland", cell: "510 777-9311")

    @owner_project = @owner.projects.create(app_name: "My great app",
                                                coding: "language",
                                                start_date: Date.today)

    login_as(@owner)
  end

  scenario "with valid data succeeds" do
    visit '/'

    click_link "My Lab"

    path = "/users/#{@owner.id}/projects/#{@owner_project.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in "Coding", with: "Language"
    click_button "Update Project"

    expect(cohort.to_i).to eql model.id
    expect(cell.to_i).to eql model.id
    expect(page).to have_content("Project has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end

end
