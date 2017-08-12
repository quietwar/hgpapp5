require "rails_helper"

RSpec.feature "Listing Projects" do
  before do
    @john =  User.create(first_name: "John", last_name: "Doe", email: "john@hgs.hiddengeniusproject.org", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Anderson", email: "sarah@hgs.hiddengeniusproject.org", password: "password")

    login_as(@john)

    @p1 = @john.projects.create(app_name: "my app",
                                  coding: "ruby",
                                  start_date: Date.today)

    @p2 = @john.projects.create(app_name: "my app",
                                  coding: "ruby",
                                  start_date: Date.today)

    @following = Friendship.create(user: @john, friend: @sarah)

     

  end

  scenario "show all of user's apps" do
    visit "/"

    click_link "My Lab"

    expect(page).to have_content(@p1.app_name)
    expect(page).to have_content(@p1.coding)
    expect(page).to have_content(@p1.start_date)

    expect(page).to have_content(@p2.app_name)
    expect(page).to have_content(@p2.coding)
    expect(page).to have_content(@p2.start_date)


  end

  scenario "shows no projects if none created" do
    @john.projects.delete_all

    visit '/'

    click_link "My Lab"

    expect(page).to have_content('No Apps Yet')
  end

  scenario "shows a list of user's friends" do
    visit "/"

    click_link "My Lab"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@sarah.full_name)
    expect(page).to have_link("Unfollow")
  end

end
