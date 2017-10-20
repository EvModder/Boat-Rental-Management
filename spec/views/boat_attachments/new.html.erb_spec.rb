require 'rails_helper'

RSpec.describe "boat_attachments/new", type: :view do
  before(:each) do
    assign(:boat_attachment, BoatAttachment.new(
      :boat_id => 1,
      :image => "MyString"
    ))
  end

  it "renders new boat_attachment form" do
    render

    assert_select "form[action=?][method=?]", boat_attachments_path, "post" do

      assert_select "input#boat_attachment_boat_id[name=?]", "boat_attachment[boat_id]"

      assert_select "input#boat_attachment_image[name=?]", "boat_attachment[image]"
    end
  end
end
