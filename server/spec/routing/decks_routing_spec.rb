require "rails_helper"

RSpec.describe Api::DecksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/decks.json").to route_to("api/decks#index", format: "json")
    end

    it "routes to #show" do
      expect(:get => "/api/decks/1.json").to route_to("api/decks#show", :id => "1", format: "json")
    end

    it "routes to #create" do
      expect(:post => "/api/decks.json").to route_to("api/decks#create", format: "json")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/decks/1.json").to route_to("api/decks#update", :id => "1", format: "json")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/decks/1.json").to route_to("api/decks#update", :id => "1", format: "json")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/decks/1.json").to route_to("api/decks#destroy", :id => "1", format: "json")
    end

  end
end
