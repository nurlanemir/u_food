ActiveAdmin.register Restaurant do

  permit_params :name, :address, :description, :latitude, :longitude, :restaurant_category, :admin_user, :pic_url

  before_create do |restaurant|
    restaurant.admin_user = current_admin_user
  end

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :address, sortable: :address
    column :restaurant_category, sortable: :restaurant_category
    column :admin_user, sortable: :admin_user if authorized? :manage
    column :description, sortable: :description
    column :pic_url
    actions
  end

  filter :name
  filter :address
  filter :restaurant_category
  filter :admin_user, collection: proc {(AdminUser.all).map {|c| [c.email, c.id]}}, if: proc {authorized? :manage}
  filter :description
  filter :pic_url

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :restaurant_category
      f.input :description
      f.input :pic_url
    end
    f.actions
  end
end
