require 'rails_helper'

RSpec.describe "Decks", type: :request do
  let(:deck) { FactoryGirl.create(:deck_with_cards) }

  # This should return the minimal set of attributes required to create a valid
  # Deck. As you add validations to Deck, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:deck).merge({
      cards_attributes: FactoryGirl.attributes_for_list(:card, 56)
    })
  }

  let(:invalid_attributes) {
    # 28/10/2016: There is presently no way to make an invalid deck
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DecksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET /api/decks" do
    it "returns a successful response" do
      get api_decks_path(format: "json")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/decks/:id" do
    it "responds with the requested deck" do
      get api_deck_path(id: deck.to_param, session: valid_session, format: "json")
      expect(response.body).to eq(deck.to_json)
    end
  end

  describe "POST /api/decks/" do
    context "with valid params" do
      it "creates a new Deck" do
        expect {
          post api_decks_path(deck: valid_attributes, session: valid_session, format: "json")
        }.to change(Deck, :count).by(1)
      end

      it "responds with the newly created deck" do
        post api_decks_path(deck: valid_attributes, session: valid_session, format: "json")
        expect(response.body).to include("created_at")
      end

      it "returns a successful response" do
        post api_decks_path(deck: valid_attributes, session: valid_session, format: "json")
        expect(response).to be_success
      end
    end

    context "with invalid params" do
      it "returns an error response" do
        post api_decks_path(deck: invalid_attributes, session: valid_session, format: "json")
        expect(response.status).to eq(Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity])
      end
    end
  end

  describe "PUT /api/decks/:id" do
    context "with valid params" do
      let(:new_card_attributes) {
        FactoryGirl.attributes_for(:card)
      }
      let(:new_attributes) {
        {cards_attributes: [new_card_attributes]}
      }

      it "updates the requested deck" do
        old_card_count = deck.cards.count
        put api_deck_path(id: deck.to_param, deck: new_attributes, session: valid_session, format: "json")
        deck.reload
        expect(deck.cards.count).to be > old_card_count
      end

      it "returns a successful response" do
        put api_deck_path(id: deck.to_param, deck: new_attributes, session: valid_session, format: "json")
        expect(response).to be_success
      end
    end

    context "with invalid params" do
      it "returns an error response" do
        put api_deck_path(id: deck.to_param, deck: invalid_attributes, session: valid_session, format: "json")
        expect(response.status).to eq(Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity])
      end
    end
  end

  describe "DELETE /api/decks/:id" do
    before(:each) do
      # Explicitely load the deck from the database to ensure Deck.count is correct
      deck.reload
    end

    it "destroys the requested deck" do
      expect {
        delete api_deck_path(id: deck.to_param, session: valid_session, format: "json")
      }.to change(Deck, :count).by(-1)
    end

    it "returns a successful response" do
      delete api_deck_path(id: deck.to_param, session: valid_session, format: "json")
      expect(response).to be_success
    end
  end

  describe "POST /api/decks/:id/shuffle_deck" do
    let(:deck) { FactoryGirl.create(:deck_with_cards) }

    it "changes the deck shuffle order for the first card" do
      first_card_weight = deck.cards.first.sort_weight
      post shuffle_deck_api_deck_path(id: deck.to_param, format: "json")
      deck.reload
      expect(deck.cards.first.sort_weight).to_not eq(first_card_weight)
    end

    it "changes the deck shuffle order for the first card" do
      last_card_weight = deck.cards.last.sort_weight
      post shuffle_deck_api_deck_path(id: deck.to_param, format: "json")
      deck.reload
      expect(deck.cards.last.sort_weight).to_not eq(last_card_weight)
    end
  end
end
