class TileImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :normal do
    process resize_to_fill: [360, 400]
    process convert: 'jpg'
  end
end
