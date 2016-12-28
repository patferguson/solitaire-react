class AddCardHierarchyAssociations < ActiveRecord::Migration[5.0]
  def change
    add_reference :cards, :parent_card, index: true
    add_reference :cards, :child_card, index: true
    add_foreign_key :cards, :parent_card
    add_foreign_key :cards, :child_card, on_delete: :cascade
  end
end
