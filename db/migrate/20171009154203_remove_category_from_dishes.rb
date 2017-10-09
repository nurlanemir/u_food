class RemoveCategoryFromDishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :category, :string
  end
end
