class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user

  belongs_to :category
end
