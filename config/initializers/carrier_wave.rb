CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_key_id'],
      aws_secret_access_key: ENV['S3_key_secret'],
      region:                ENV['S3_region']
    }
    config.fog_directory = ENV['S3_bucket']
    config.fog_public = false
    config.storage = :fog

  else
    config.storage = :file
  end
end
