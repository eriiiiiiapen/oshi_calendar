class CreateCategoryMerchandises < ActiveRecord::Migration[6.0]
  def change
    create_table :category_merchandises do |t|
      t.references :category, null: false, foreign_key: true
      t.references :merchandise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
