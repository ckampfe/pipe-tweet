require './env'
require './options'

module PipeTweet
  class TweetCollection
    def initialize(tweet_collection)
      @collection = tweet_collection
    end

    def send(interval=15)
      @collection.each do |tweet|
        puts "tweet # #{@collection.index(tweet) + 1}"
        CLIENT.update(tweet)
        sleep interval
      end
    end
  end

  def tweets
    base_string = ""
    while line = gets
      base_string += line
    end

    tweet_list = split(base_string)
    TweetCollection.new(tweet_list)
  end
end
