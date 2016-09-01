class Dish < ApplicationRecord
  mount_uploader :image, ImageUploader

  CATEGORIES = ['Starter', 'Main Course', 'Dessert']
  belongs_to :menu
  validates_presence_of :name,
                        :price,
                        :menu,
                        :category,
                        :description

  validates :category, inclusion: CATEGORIES


end
