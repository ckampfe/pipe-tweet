def splitter(given_string)
  given_string.gsub!("\r\n", "")
  return [given_string] if given_string.length <= 140

  split_rec = lambda do |remaining_string, tweet_array|
    i = 139
    while i > 0
      unless remaining_string[i] =~ (/\W/)
        i -= 1
      else
        remaining_string.strip!
        tweet_array << remaining_string.slice!(/(.{,140}\b)/).strip
        split_rec.call(remaining_string, tweet_array)
      end
    end

    return tweet_array
  end

  tweets = []

  split_rec.call(given_string, tweets)
end
