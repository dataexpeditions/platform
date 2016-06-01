class PartnerLogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :normal do
    process resize_to_fit: [200, 200]
    process convert: 'png'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
