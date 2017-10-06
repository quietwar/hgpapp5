require "rails_helper"

RSpec.feature "Deleting project" do
  before do
    @owner = User.create!(first_name: "John", last_name: "Doe", email: "owner@hgs.hiddengeniusproject.org", password: "password", cohort: 5, city: "Oakland", cell: "510 777-9311")

    @owner_project = @owner.projects.create(app_name: "The greatet ever",
                                                coding: "language",
                                                start_date: Date.today)

    login_as(@owner)
  end

  scenario do
    visit "/"

    click_link "My Lab"

    path = "/users/#{@owner.id}/projects/#{@owner_project.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"

    find(:xpath, link).click
    expect(cohort.to_i).to eql model.id
    expect(cell.to_i).to eql model.id
    expect(page).to have_content("Project has been deleted")
  end

end
