class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :normal do
    process resize_to_fill: [360, 360]
    process convert: 'png'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/avatar_default.png")
  end
end
