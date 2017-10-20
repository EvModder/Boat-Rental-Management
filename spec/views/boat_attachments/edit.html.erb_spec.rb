require 'rails_helper'

RSpec.describe "boat_attachments/edit", type: :view do
  before(:each) do
    @boat_attachment = assign(:boat_attachment, BoatAttachment.create!(
      :boat_id => 1,
      :image => "MyString"
    ))
  end

  it "renders the edit boat_attachment form" do
    render

    assert_select "form[action=?][method=?]", boat_attachment_path(@boat_attachment), "post" do

      assert_select "input#boat_attachment_boat_id[name=?]", "boat_attachment[boat_id]"

      assert_select "input#boat_attachment_image[name=?]", "boat_attachment[image]"
    end
  end
end
