class Card < ActiveRecord::Base
  extend Enumerize

  # Associations
  ##############

  belongs_to :parent_card, class_name: 'Card', inverse_of: :child_card, optional: true
  has_one :child_card, class_name: 'Card', inverse_of: :parent_card, dependent: :destroy, foreign_key: "parent_card_id"

  # Enumerations
  ##############

  enumerize :suit, in: [:diamond, :club, :heart, :spades]

  # Validations
  #############

  validates_presence_of :suit
  validates_presence_of :face_value
  validates :is_flipped_up, :inclusion => { :in => [true, false], :message => 'requires a true or false value' }

  # Index: 0 1 2 3 4 5 6 7 8 9 10 11 12 13
  #  Card: A 1 2 3 4 5 6 7 8 9 10 J  Q  K
  validates_inclusion_of :face_value, :in => 0..13, :allow_blank => true, :message => "must have a face value from Ace through to King (0-13)"

  validate :parent_has_child_set?
  def parent_has_child_set?
    if self.parent_card
      errors.add(:parent_card, "doesn't have this card set as child_card") if self.parent_card.child_card != self
    end
  end

  validate :child_has_parent_set?
  def child_has_parent_set?
    if self.child_card
      errors.add(:child_card, "doesn't have this card set as parent_card") if self.child_card.parent_card != self
    end
  end

  # Helper Methods
  ################

  def suit_color
    if self.suit.diamond? || self.suit.heart?
      return :red
    elsif self.suit.club? || self.suit.spades?
      return :black
    end
    return :unknown
  end

  def attach_to_card(card)
    card.child_card = self
    self.parent_card = card
  end

  def detach_from_parent
    if self.parent_card.exists?
      # Clear card associations from both ends
      self.parent_card.child_card = nil
      self.parent_card = nil
    end
  end
end
