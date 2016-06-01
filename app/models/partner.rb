class Partner < ActiveRecord::Base
  mount_uploader :logo, PartnerLogoUploader
end
