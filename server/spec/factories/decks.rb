FactoryGirl.define do
  factory :deck do

    factory :deck_with_cards do
      # 56 cards in a standard deck (Ace through King, four suits)
      cards { build_list(:card, 56) }
    end
  end
end
