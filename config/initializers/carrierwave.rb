CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider:              ENV.fetch('FOG_PROVIDER'),
      aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      aws_secret_access_key: ENV.fetch('AWS_ACCESS_KEY_SECRET'),
      region:                ENV.fetch('FOG_REGION'),
    }
    config.fog_directory = ENV.fetch('FOG_DIRECTORY')
  else
    config.storage = :file
  end
end
