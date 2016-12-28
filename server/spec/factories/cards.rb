FactoryGirl.define do
  factory :card do
    suit [:diamond, :club, :heart, :spades].sample
    face_value Faker::Number.between(0, 13)
    is_flipped_up Faker::Boolean.boolean

    trait :with_parent_card do
      parent_card { build(:card) }
      after(:build) do |card|
        card.attach_to_card(parent_card)
      end
    end

    trait :with_child_card do
      child_card { build(:card) }
      after(:build) do |card|
        child_card.attach_to_card(card)
      end
    end
  end
end
