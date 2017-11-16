require 'carrierwave/orm/activerecord'
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                        # required
  #config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      :provider =>              'AWS',                        # required
      :aws_access_key_id =>     'AKIAILG26VPIWQPYEXMQ',                        # required
      :aws_secret_access_key => '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',                        # required
      :region =>                'us-east-2',                  # optional, defaults to 'us-east-1'
      #host:                  's3.example.com',             # optional, defaults to nil
      #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'asset'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  #config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
end