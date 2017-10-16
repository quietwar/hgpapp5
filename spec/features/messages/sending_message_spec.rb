require "rails_helper"

RSpec.feature "Sending a message" do
  before do
    @john = User.create(first_name: 'John', last_name: 'Doe', email: 'john@hgs.hiddengeniusproject.org', password: 'password', cohort_id: 5, city: "Oakland", cell: (5107779311))
    @sarah = User.create(first_name: 'Sarah', last_name: 'Anderson', email: 'sarah@hgs.hiddengeniusproject.org', password: 'password', cohort_id: 5, city: "Oakland", cell: (5107779311))
    @henry = User.create(first_name: 'Henry', last_name: 'Flynn', email: 'henry@hgs.hiddengeniusproject.org', password: 'password', cohort_id: 5, city: "Oakland", cell: (5107779311))

    @room_name = @john.first_name + '-' + @john.last_name
    @room = Room.create(name: @room_name, user_id: @john.id)

    login_as(@john)

    Friendship.create(user: @sarah, friend: @john)
    Friendship.create(user: @henry, friend: @john)
  end

  scenario "to followers shows in room window" do
    visit '/'

    click_link "My lab"
    expect(page).to have_content(@room_name)

    fill_in "message-field", with: "Hello"
    click_button "Post"

    expect(page).to have_content("Hello")

    within("#followers") do
      expect(page).to have_link(@sarah.full_name)
      expect(page).to have_link(@henry.full_name)
    end
  end

end
