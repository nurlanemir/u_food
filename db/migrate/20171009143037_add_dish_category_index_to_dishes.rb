class AddDishCategoryIndexToDishes < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :dish_category, index: true, foreign_key: true
  end
end
