require 'pathname'
require 'twitter'
require 'optparse'
require 'yaml'

require './split'

APP_ROOT = Pathname.new(File.expand_path('..', __FILE__))

env_config = YAML.load_file(APP_ROOT.join('twitter.yml'))

env_config.each do |key, value|
  ENV[key] = value
end

CLIENT = Twitter.configure do |config|
  config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
end
