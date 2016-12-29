class CardSerializer < ActiveModel::Serializer
  attributes :id, :suit, :face_value, :is_flipped_up, :parent_card, :child_card, :deck
end
