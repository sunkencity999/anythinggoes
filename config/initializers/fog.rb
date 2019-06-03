require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    provider:              'AWS',       
    aws_access_key_id:     'AKIAQK4F5UWEAVYQDF5E',    
    aws_secret_access_key: '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'
   # use_iam_profile:       true,                         # optional, defaults to false
   # region:                'us-east-1',                  # optional, defaults to 'us-east-1'
   # host:                  's3.example.com',             # optional, defaults to nil
   # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'anythinggoesimages'
  # config.fog_public     = false                                                 # optional, defaults to true
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  config.permissions = 0666
  config.directory_permissions = 0777
  
end
