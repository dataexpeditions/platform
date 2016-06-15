class Partner < ActiveRecord::Base
  mount_uploader :logo, PartnerLogoUploader

  validates :name, presence: true
  validates :logo, presence: true
end
