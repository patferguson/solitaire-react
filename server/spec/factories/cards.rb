FactoryGirl.define do
  factory :card do
    suit [:diamond, :club, :heart, :spades].sample
    face_value Faker::Number.between(0, 13)
    is_flipped_up Faker::Boolean.boolean

    trait :with_parent_card do
      parent_card { build(:card) }
    end

    trait :with_child_card do
      child_card { build(:card) }
    end

    trait :with_black_suit do
      suit [:club, :spades].sample
    end

    trait :with_red_suit do
      suit [:diamond, :heart].sample
    end
  end
end
