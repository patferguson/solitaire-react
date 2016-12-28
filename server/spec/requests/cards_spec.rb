require 'rails_helper'

RSpec.describe "Cards", type: :request do
  describe "GET /cards" do
    it "works! (now write some real specs)" do
      get api_cards_path(format: "json")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /cards/1/attach_to_card/2" do
    let(:card) { FactoryGirl.create(:card) }
    let(:new_parent_card) { FactoryGirl.create(:card) }

    it "attaches to the new card" do
      post attach_to_card_api_card_path(id: card.to_param, parent_card_id: new_parent_card.to_param, format: "json")
      card.reload
      expect(card.parent_card).to eq(new_parent_card)
    end
  end
end
