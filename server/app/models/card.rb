class Card < ActiveRecord::Base
  extend Enumerize

  # Associations
  ##############

  # For housing cards in 'Decks'
  belongs_to :deck, inverse_of: :cards, optional: true

  # For attaching cards to one another in 'stacks'
  belongs_to :parent_card, class_name: 'Card', inverse_of: :child_card, optional: true
  has_one :child_card, class_name: 'Card', inverse_of: :parent_card, dependent: :destroy, foreign_key: "parent_card_id"

  # Constructor
  #############

  def initialize(attributes=nil)
    super(attributes)

    # This score will be used to sort cards in a given deck
    self.sort_weight ||= Card.random_sort_weight
  end

  # Class Methods
  ###############

  def self.face_value_range
    return 0..13
  end

  # Returns an array of all possible face values
  def self.possible_face_values
    return Card.face_value_range.to_a
  end

  def self.suit_types
    return [:diamond, :club, :heart, :spades]
  end

  def self.random_sort_weight
    return rand(0..1000000)
  end

  # Builds a collection of all of the cards for each suit and returns
  def self.build_full_card_set
    cards = Card.suit_types.map { |suit|
        Card.possible_face_values.map { |face_value|
          Card.new({
            suit: suit,
            face_value: face_value,
            is_flipped_up: false,
          })
        }
      }.flatten
    return cards
  end

  # Enumerations
  ##############

  enumerize :suit, in: Card.suit_types

  # Validations
  #############

  validates_presence_of :suit
  validates_presence_of :face_value
  validates :is_flipped_up, :inclusion => { :in => [true, false], :message => 'requires a true or false value' }

  # Index: 0 1 2 3 4 5 6 7 8 9 10 11 12 13
  #  Card: A 1 2 3 4 5 6 7 8 9 10 J  Q  K
  validates_inclusion_of :face_value, :in => Card.possible_face_values, :allow_blank => true, :message => "must have a face value from Ace through to King (0-13)"

  validates_presence_of :sort_weight, :if => Proc.new { |card| card.deck.present? }

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
    # Presume black if unknown
    out_suit_color = :black
    if self.suit.diamond? || self.suit.heart?
      out_suit_color = :red
    elsif self.suit.club? || self.suit.spades?
      out_suit_color = :black
    end
    return out_suit_color
  end
end
