CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['aws_key'],               # required
    aws_secret_access_key: ENV['aws_secret'],            # required
  }
  config.fog_directory  = ENV['aws_storage']             # required
end