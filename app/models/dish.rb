class Dish < ApplicationRecord
  include HasAttachedImage
  belongs_to :dish_category
  belongs_to :restaurant
  has_many :menu_lines
  has_many :menus, through: :menu_lines

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
