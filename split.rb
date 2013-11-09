# potential features:
# 1. insert (1 of 3) markers, etc
# 2. insert ellipis at end of each non-final tweet
# 3. ability to force preview of tweet, for example,
# with a -p switch, with a 'y/n' to tweet


# inputs <= 140 chars are returned as a string;
# inputs > 140 chars are returned as an array of strings

def splitter(given_string)
  return given_string if given_string.length <= 140

  split_rec = lambda do |remaining_string, tweet_array|
    i = 139
    while i >= 0
      unless remaining_string[i] =~ (/\W/)
        i -= 1
      else
        remaining_string.strip!
        tweet_array << remaining_string.slice!(/(.{,140}\b)/)
        split_rec.call(remaining_string, tweet_array)
      end
    end

    return tweet_array
  end

  tweets = []

  split_rec.call(given_string, tweets)
end
