require "rails_helper"

RSpec.describe Card, type: :model do
  let(:card) { FactoryGirl.build(:card) }

  context "with default attributes" do
    it "saves without validation errors" do
      result = card.save
      expect(result).to be true
      expect(card.errors).to be_empty
    end
  end

  context "when a child card is attached" do
    let(:new_child_card) { FactoryGirl.build(:card) }

    before(:each) do
      card.child_card = new_child_card
    end

    it "saves without validation errors" do
      result = card.save
      expect(result).to be true
      expect(card.errors).to be_empty
    end

    it "has child_card set to the child card" do
      card.save!
      card.reload
      expect(card.child_card).to eq(new_child_card)
    end

    it "is the new parent_card of the child card" do
      card.save!
      card.reload
      expect(card.child_card.parent_card).to eq(card)
    end
  end

  context "with a parent card" do
    let(:card_with_parent) { FactoryGirl.build(:card, :with_parent_card) }

    it "saves without validation errors" do
      result = card_with_parent.save
      expect(result).to be true
      expect(card_with_parent.errors).to be_empty
    end

    it "has parent_card set" do
      card_with_parent.save!
      card_with_parent.reload
      expect(card_with_parent.parent_card).to_not be_nil
    end
  end

  context "with a child card" do
    let(:card_with_child) { FactoryGirl.build(:card, :with_child_card) }

    it "saves without validation errors" do
      result = card_with_child.save
      expect(result).to be true
      expect(card_with_child.errors).to be_empty
    end

    it "has child_card set" do
      card_with_child.save!
      card_with_child.reload
      expect(card_with_child.child_card).to_not be_nil
    end
  end

  context "with a 'red' suit explicitely set" do
    let(:card_with_red_suit) { FactoryGirl.build(:card, :with_red_suit) }

    before(:each) do
      card_with_red_suit.save!
    end

    it "has a 'red' suit" do
      expect(card_with_red_suit.suit_color).to eq(:red)
    end
  end

  context "with a 'black' suit explicitely set" do
    let(:card_with_black_suit) { FactoryGirl.build(:card, :with_black_suit) }

    before(:each) do
      card_with_black_suit.save!
    end

    it "has a 'black' suit" do
      expect(card_with_black_suit.suit_color).to eq(:black)
    end
  end

  context "when generating a full set of cards" do
    before(:each) do
      @cards = Card.build_full_card_set
    end

    it "has a full set of cards" do
      expect(@cards.size).to eq(
        Card.suit_types.size * Card.possible_face_values.size
      )
    end

    it "creates valid cards" do
      has_invalid_card = @cards.any? { |card| !card.valid? }
      expect(has_invalid_card).to eq(false)
    end
  end
end
