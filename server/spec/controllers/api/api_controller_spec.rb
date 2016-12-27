require 'rails_helper'

RSpec.describe Api::ApiController, type: :controller do
  describe "GET #version" do
    it "returns http success" do
      get :version, :format => :json
      expect(response).to have_http_status(:success)
    end

    it "returns the project's version in the JSON response" do
      get :version, :format => :json
      expect(response.body).to include(APP_VERSION)
    end
  end

  describe "POST #ping" do
    it "returns http success on sending 'Ping!'" do
      post :ping, :format => :json, params: { ping_message: "Ping!" }
      expect(response).to have_http_status(:success)
    end

    it "returns 'Pong!' on sending 'Ping!'" do
      post :ping, :format => :json, params: { ping_message: "Ping!" }
      expect(response.body).to include('Pong!')
    end

    it "returns http bad_request on sending an unknown Ping message" do
      post :ping, :format => :json, params: { ping_message: "ASDSADAD!" }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
