require "rails_helper"

RSpec.describe BoatAttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/boat_attachments").to route_to("boat_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/boat_attachments/new").to route_to("boat_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/boat_attachments/1").to route_to("boat_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/boat_attachments/1/edit").to route_to("boat_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/boat_attachments").to route_to("boat_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/boat_attachments/1").to route_to("boat_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/boat_attachments/1").to route_to("boat_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/boat_attachments/1").to route_to("boat_attachments#destroy", :id => "1")
    end

  end
end
