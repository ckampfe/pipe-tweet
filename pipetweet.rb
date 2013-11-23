require './environment'
require './options'

class Collection

  def initialize(tweet_collection)
    @collection = tweet_collection
  end

  def send(interval)
    @collection.each do |tweet|
      puts "tweet # #{@collection.index(tweet)}"
      CLIENT.update(tweet.body)
      sleep(interval)
    end
  end

  def sleep(sec=15)
    sleep(sec)
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

debugger
s = splitter(base_string) # split string
tweets = s.map { |t| Tweet.new(t) } # tweet objects
collection = Collection.new(tweets) # tweet collection
debugger
p options
p options[:interval]
collection.send(options[:interval])
