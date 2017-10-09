class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :pic_url
      t.references :dish_category, foreign_key: true

      t.timestamps
    end
  end
end
