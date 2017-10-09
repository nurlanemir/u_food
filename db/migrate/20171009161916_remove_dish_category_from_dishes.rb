class RemoveDishCategoryFromDishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :dish_category, :string
  end
end
