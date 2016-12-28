class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :suit
      t.integer :face_value
      t.boolean :is_flipped_up

      t.timestamps
    end
  end
end
