class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :body, null: false
      t.date :date, null: false

      t.timestamps
    end

    add_index :notes, [:user_id, :created_at]
    add_index :notes, :body
  end
end
