require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!())
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", events_1_path(@events), "post" do
    end
  end
end
