class AddSortWeightToCard < ActiveRecord::Migration[5.0]
  def change
    # This is used to sort cards within a deck
    add_column :cards, :sort_weight, :integer
  end
end
