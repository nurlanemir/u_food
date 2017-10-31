ActiveAdmin.register Dish do

  permit_params :name, :description, :price, :image, :dish_category_id, :restaurant_id

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :description, sortable: :description
    column :price, sortable: :price
    column :dish_category, sortable: :dish_category, as: :select, collection: DishCategory.all.select {|t| [t.name]}
    column :restaurant, sortable: :restaurant
    column :image, sortable: :image
    actions
  end

  filter :name
  filter :description
  filter :price
  filter :restaurant, as: :select, collection: proc {current_admin_user.restaurants}
  filter :menu
  filter :dish_category_id, as: :select, collection: proc {DishCategory.all.select {|dc| [dc.name]}}

  form do |f|
    f.inputs do
      f.input :name
      if current_admin_user.super_admin?
        f.input :restaurant_id, as: :select, collection: Restaurant.all.select {|r| [r.name]}
      else
        f.input :restaurant_id, as: :select, collection: Restaurant.all.select {|r| [r.name] if current_admin_user.restaurants.ids.any? {|id| id == r.id}}
      end
      f.input :menu_lines, label: "Menu", as: :select, collection: Menu.all.select {|m| [m.name]}
      f.input :dish_category_id, as: :select, collection: DishCategory.all.select {|dc| [dc.name]}
      f.input :price, label: "Price in $"
      f.input :image
      f.input :description
    end
    f.actions
  end
  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :dish_category
      row :image do |ad|
        image_tag ad.image.url
      end
    end
  end
end

