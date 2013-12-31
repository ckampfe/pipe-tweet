require './env'
require './options'

class Collection

  def initialize(tweet_collection)
    @collection = tweet_collection
  end

  def send(interval=15)
    @collection.each do |tweet|
      puts "tweet # #{@collection.index(tweet)}"
      CLIENT.update(tweet.body)
      sleep_for(interval)
    end
  end

  def sleep_for(sec)
    sleep sec
  end
end


class Tweet

  attr_reader :body

  def initialize(tweet)
    @body = tweet
  end
end

### DRIVER ###

options = get_opts # options from optionparser

base_string = ""

# so as to get multiple lines of text
while line = gets
  base_string += line
end

s = split(base_string) # split string
tweets = s.map { |t| Tweet.new(t) } # tweet objects
collection = Collection.new(tweets) # tweet collection

if options[:interval]
  collection.send(options[:interval])
else
  collection.send
end
