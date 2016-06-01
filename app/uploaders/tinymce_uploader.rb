class TinymceUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
