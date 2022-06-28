class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :content

      t.timestamps
    end
  end
end
