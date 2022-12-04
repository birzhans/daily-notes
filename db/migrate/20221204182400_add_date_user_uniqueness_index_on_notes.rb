class AddDateUserUniquenessIndexOnNotes < ActiveRecord::Migration[7.0]
  def change
    add_index :notes, [:user_id, :date], unique: true
  end
end
