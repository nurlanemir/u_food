class Dish < ApplicationRecord
  belongs_to :dish_category
  belongs_to :restaurant
  has_many :menu_lines
  has_many :menus, through: :menu_lines
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :pic_url, presence: true
end
