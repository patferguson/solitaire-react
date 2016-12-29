require 'rails_helper'

RSpec.describe "Decks", type: :request do
  describe "GET /decks" do
    it "returns a successful response" do
      get api_decks_path(format: "json")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /decks/1/shuffle_deck" do
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
