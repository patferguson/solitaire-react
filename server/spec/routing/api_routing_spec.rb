require "rails_helper"

RSpec.describe Api::ApiController, type: :routing do
  describe "routing" do
    it "routes to #version" do
      expect(:get => "/api/version.json").to route_to("api/api#version", :format => "json")
    end

    it "routes to #ping" do
      expect(:post => "/api/ping.json").to route_to("api/api#ping", :format => "json")
    end
  end
end
