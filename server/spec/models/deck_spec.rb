require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:deck) { FactoryGirl.create(:deck_with_cards) }

  context "when shuffled" do
    it "has the same number of cards" do
      deck.save!
      expect(deck.shuffled_cards.count).to eq(deck.cards.count)
    end

    it "is shuffled" do
      deck.save!
      expect(deck.shuffled_cards.first.sort_weight).to be < deck.shuffled_cards.last.sort_weight
    end
  end
end
