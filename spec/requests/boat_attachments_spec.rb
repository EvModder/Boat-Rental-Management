require 'rails_helper'

RSpec.describe "BoatAttachments", type: :request do
  describe "GET /boat_attachments" do
    it "works! (now write some real specs)" do
      get boat_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
