require "rails_helper"

RSpec.describe Api::CardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/cards.json").to route_to("api/cards#index", :format => "json")
    end

    it "routes to #show" do
      expect(:get => "/api/cards/1.json").to route_to("api/cards#show", :id => "1", :format => "json")
    end

    it "routes to #create" do
      expect(:post => "/api/cards.json").to route_to("api/cards#create", :format => "json")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/cards/1.json").to route_to("api/cards#update", :id => "1", :format => "json")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/cards/1.json").to route_to("api/cards#update", :id => "1", :format => "json")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/cards/1.json").to route_to("api/cards#destroy", :id => "1", :format => "json")
    end
  end
end
