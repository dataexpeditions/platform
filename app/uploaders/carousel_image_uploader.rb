class CarouselImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :carousel do
    process resize_to_fill: [1200, 400]
    process convert: 'png'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
