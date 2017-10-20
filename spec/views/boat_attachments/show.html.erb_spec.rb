require 'rails_helper'

RSpec.describe "boat_attachments/show", type: :view do
  before(:each) do
    @boat_attachment = assign(:boat_attachment, BoatAttachment.create!(
      :boat_id => 2,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Image/)
  end
end
