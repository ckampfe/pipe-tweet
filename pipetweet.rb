require './environment'

class Collection

  def initialize(tweet_collection)
    @collection = tweet_collection
  end

  def send_tweets
    @collection.each do |tweet|
      puts "tweet # #{@collection.index(tweet)}"
      CLIENT.update(tweet.body)
      sleep_15
    end
  end

  def sleep_15
    sleep(15)
  end
end


class Tweet

  attr_reader :body

  def initialize(tweet)
    @body = tweet
  end
end

base_string = ""

# so as to get multiple lines of text
while line = gets
  base_string += line
end

s = splitter(base_string)
tweets = s.map { |t| Tweet.new(t) }
collection = Collection.new(tweets)
collection.send_tweets
