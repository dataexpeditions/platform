class TinymceUpload < ActiveRecord::Base
  mount_uploader :image, TinymceUploader

  belongs_to :user, inverse_of: nil

  validates :image, presence: true
end
