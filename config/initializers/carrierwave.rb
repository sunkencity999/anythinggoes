CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    :provider =>              'AWS',       
    :aws_access_key_id =>     ENV["AWS_ACCESS_KEY_ID"],    
    :aws_secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],
    :region =>                'us-east-2'                 
   # host:                  's3.example.com',             # optional, defaults to nil
   # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  
  # config.storage = :fog 
  config.fog_directory  = 'anythinggoesimages'
  # config.fog_public     = false                                                 # optional, defaults to true
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  config.permissions = 0666
  config.directory_permissions = 0777
 
end
