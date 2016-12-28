require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card) { FactoryGirl.build(:card) }

  context "with default attributes" do
    it "saves without validation errors" do
      result = card.save
      expect(result).to be true
      expect(card.errors).to be_empty
    end
  end
end
