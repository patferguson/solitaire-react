require 'rails_helper'

RSpec.describe "Api", type: :request do
  describe "GET /api/version" do
    it "returns the application version in the reponse body" do
      get api_version_path(format: "json")
      expect(response.body).to include(APP_VERSION)
    end

    it "returns a successful response" do
      get api_version_path(format: "json")
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /api/ping" do
    it "returns http success on sending 'Ping!'" do
      post api_ping_path(ping_message: "Ping!", format: "json")
      expect(response).to have_http_status(:success)
    end

    it "returns 'Pong!' on sending 'Ping!'" do
      post api_ping_path(ping_message: "Ping!", format: "json")
      expect(response.body).to include('Pong!')
    end

    it "returns http unprocessable_entity on sending an unknown Ping message" do
      post api_ping_path(ping_message: "ASDSADAD!", format: "json")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
