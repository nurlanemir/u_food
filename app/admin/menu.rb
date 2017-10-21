ActiveAdmin.register Menu do

  permit_params :name, :restaurant_id

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :restaurant, sortable: :restaurant
    actions
  end

  filter :name
  filter :restaurant, as: :select, collection: proc{ current_admin_user.restaurants }

  form do |f|
    f.inputs do
      f.input :name
      if current_admin_user.super_admin?
        f.input :restaurant_id, as: :select, collection: Restaurant.all.select { |r| [r.name] }
      else
        f.input :restaurant_id, as: :select, collection: Restaurant.all.select { |r| [r.name] if current_admin_user.restaurants.ids.any? {|id| id == r.id } }
      end
    end
    f.actions
  end
end
