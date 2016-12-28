class Deck < ApplicationRecord
  # Associations
  ##############

  has_many :cards, inverse_of: :deck, dependent: :destroy
  accepts_nested_attributes_for :cards

  # Validations
  #############

  validates_presence_of :cards

  # Helper Methods
  ################

  def next_card
    return self.cards.first
  end

  def shuffled_cards
    return self.cards.order(:sort_weight => :asc)
  end
end
