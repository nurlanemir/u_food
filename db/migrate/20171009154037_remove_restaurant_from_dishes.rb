class RemoveRestaurantFromDishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :restaurant, :string
  end
end
