class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :content

      t.timestamps
    end
  end
end
