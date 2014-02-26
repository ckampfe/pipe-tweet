require 'pathname'
require 'twitter'
require 'optparse'
require 'yaml'

require './helpers'

APP_ROOT = Pathname.new(File.expand_path('..', __FILE__))

env_config = YAML.load_file(APP_ROOT.join('twitter.yml'))

env_config.each do |key, value|
  ENV[key] = value
end

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end
