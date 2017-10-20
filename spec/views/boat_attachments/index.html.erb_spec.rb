require 'rails_helper'

RSpec.describe "boat_attachments/index", type: :view do
  before(:each) do
    assign(:boat_attachments, [
      BoatAttachment.create!(
        :boat_id => 2,
        :image => "Image"
      ),
      BoatAttachment.create!(
        :boat_id => 2,
        :image => "Image"
      )
    ])
  end

  it "renders a list of boat_attachments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
