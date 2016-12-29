require 'rails_helper'

RSpec.describe "Cards", type: :request do
  let(:card) { FactoryGirl.create(:card) }

  # This should return the minimal set of attributes required to create a valid
  # Card. As you add validations to Card, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:card)
  }

  let(:invalid_attributes) {
    { face_value: -9999 }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET /api/cards" do
    it "returns a successful response" do
      get api_cards_path(format: "json")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/cards/:id" do
    it "responds with the requested card" do
      get api_card_path(id: card.to_param, session: valid_session, format: "json")
      expect(response.body).to eq(CardSerializer.new(card).to_json)
    end
  end

  describe "POST /api/cards/" do
    context "with valid params" do
      it "creates a new Card" do
        expect {
          post api_cards_path(card: valid_attributes, session: valid_session, format: "json")
        }.to change(Card, :count).by(1)
      end

      it "responds with the newly created card" do
        post api_cards_path(card: valid_attributes, session: valid_session, format: "json")
        expect(JSON.parse(response.body)).to include(JSON.parse(valid_attributes.to_json))
      end

      it "returns a successful response" do
        post api_cards_path(card: valid_attributes, session: valid_session, format: "json")
        expect(response).to be_success
      end
    end

    context "with invalid params" do
      it "returns an error response" do
        post api_cards_path(card: invalid_attributes, session: valid_session, format: "json")
        expect(response.status).to eq(Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity])
      end
    end
  end

  describe "PUT /api/cards/:id" do
    context "with valid params" do
      let(:new_face_value) {
        [*0..13].sample
      }
      let(:new_attributes) {
        { face_value: new_face_value }
      }

      it "updates the requested card" do
        put api_card_path(id: card.to_param, card: new_attributes, session: valid_session, format: "json")
        card.reload
        expect(card.face_value).to eq(new_face_value)
      end

      it "responds with the card including the updated value" do
        put api_card_path(id: card.to_param, card: new_attributes, session: valid_session, format: "json")
        # The face_value key will be a string in the JSON body and not a symbol
        expect(JSON.parse(response.body)["face_value"]).to eq(new_face_value)
      end

      it "returns a successful response" do
        put api_card_path(id: card.to_param, card: new_attributes, session: valid_session, format: "json")
        expect(response).to be_success
      end
    end

    context "with invalid params" do
      it "returns an error response" do
        put api_card_path(id: card.to_param, card: invalid_attributes, session: valid_session, format: "json")
        expect(response.status).to eq(Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity])
      end
    end
  end

  describe "DELETE /api/cards/:id" do
    before(:each) do
      # Explicitely load the card from the database to ensure Card.count is correct
      card.reload
    end

    it "destroys the requested card" do
      expect {
        delete api_card_path(id: card.to_param, session: valid_session, format: "json")
      }.to change(Card, :count).by(-1)
    end

    it "returns a successful response" do
      delete api_card_path(id: card.to_param, session: valid_session, format: "json")
      expect(response).to be_success
    end
  end

  describe "POST /api/cards/:id/attach_to_card/:parent_card_id" do
    let(:new_parent_card) { FactoryGirl.create(:card) }

    it "attaches to the new card" do
      post attach_to_card_api_card_path(id: card.to_param, parent_card_id: new_parent_card.to_param, format: "json")
      card.reload
      expect(card.parent_card).to eq(new_parent_card)
    end

    context "with an invalid parent_card_id" do
      let(:invalid_parent_card_id) { 99999 }

      it "returns an error response" do
        post attach_to_card_api_card_path(id: card.to_param, parent_card_id: invalid_parent_card_id, format: "json")
        card.reload
        expect(response.status).to eq(Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity])
      end

      it "keeps the original parent_card" do
        original_parent_card = card.parent_card
        post attach_to_card_api_card_path(id: card.to_param, parent_card_id: invalid_parent_card_id, format: "json")
        card.reload
        expect(card.parent_card).to eq(original_parent_card)
      end
    end
  end
end
