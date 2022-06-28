class AddMerchandiseToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :merchandise, foreign_key: true
  end
end
