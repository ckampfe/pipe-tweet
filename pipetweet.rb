require './env'
require './options'

class Collection

  def initialize(tweet_collection)
    @collection = tweet_collection
  end

  def send(interval=15)
    @collection.each do |tweet|
      puts "tweet # #{@collection.index(tweet) + 1}"
      CLIENT.update(tweet)
      sleep_for(interval)
    end
  end

  def sleep_for(sec)
    sleep sec
  end
end

### DRIVER ###

options = get_opts # options from optionparser
base_string = ""

# so as to get multiple lines of text
while line = gets
  base_string += line
end

tweets = split(base_string) # split string
collection = Collection.new(tweets) # tweet collection

if options[:interval]
  collection.send(options[:interval])
else
  collection.send
end
