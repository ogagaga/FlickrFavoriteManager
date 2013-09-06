# /app/config/initializers/load_app_config.rb

config_file = File.join(Rails.root, 'config', 'flickr_conf.yml')
FLICKR_CONFIG = YAML.load(File.open(config_file))
# puts "#{FLICKR_CONFIG.inspect}"

begin
  FlickRaw.api_key = FLICKR_CONFIG['flickr']['api_key']
  FlickRaw.shared_secret = FLICKR_CONFIG['flickr']['shared_secret']
  flickr.access_secret = FLICKR_CONFIG['flickr']['access_secret']
  flickr.access_token = FLICKR_CONFIG['flickr']['access_token']
rescue
  puts "[ERROR] Flickr is not available"
end

