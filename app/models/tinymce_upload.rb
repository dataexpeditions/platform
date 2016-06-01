class TinymceUpload < ActiveRecord::Base
  mount_uploader :image, TinymceUploader

  validates :image, presence: true
end
