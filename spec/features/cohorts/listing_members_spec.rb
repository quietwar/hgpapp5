require "rails_helper";

RSpec.feature "Listing Geniuses" do
  before do
    @john = User.create(first_name: "John",
                        last_name: "Doe",
                        email: "john@hgs.hiddengeniusproject.org",
                        password: "password", city: "Oakland", cohort_id: (0), cell: (5107779311))

    @sarah = User.create(first_name: "Sarah",
                         last_name: "Jones",
                         email: "sarah@hgs.hiddengeniusproject.org",
                         password: "password", city: "Oakland", cohort_id: (0), cell: (5107779311))
  end

  scenario "shows a list of geniuses" do
    visit "/"


    expect(page).to have_content("Geniuses")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end
