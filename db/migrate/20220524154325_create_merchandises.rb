class CreateMerchandises < ActiveRecord::Migration[6.0]
  def change
    create_table :merchandises do |t|
      t.string :name, null: false
      t.string :content
      t.integer :price, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
