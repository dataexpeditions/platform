class Category < ActiveRecord::Base
  mount_uploader :tile_image, TileImageUploader

  has_many :studies

  validates :name, presence: true
  validates :tile_image, presence: true
end
