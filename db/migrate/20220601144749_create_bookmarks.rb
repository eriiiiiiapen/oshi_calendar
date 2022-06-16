class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :merchandise, null: false, foreign_key: true
      t.integer :amount, null: false, default: 1

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :merchandise_id], unique: true
  end
end
