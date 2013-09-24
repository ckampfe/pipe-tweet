# potential features:
# 1. insert (1 of 3), etc
# insert ellipis at end of each non-final tweet


# inputs <= 140 chars are returned as a string;
# inputs > 140 chars are returned as an array of strings

def split_encapsulation(s)
  if s.length <= 140
    return s
  end
  
  # potential for refactoring: delete first lambda if block
  
  # doesn't really require a base case, since the lengths are computed
  # by iteration and flow control 
  splitter = lambda do |remaining_string, a|
    # if the 140th character is a word, take the first 140 chars as a tweet
    if remaining_string[139] == /\W/
      a << remaining_string.slice!(/^.{140}/) 
      splitter.call(remaining_string, a)
    else
      # find the first word, and take from there to zero
      i = 139 # start at remaining_string[139], ie length=140
      while i > 0
        unless remaining_string[i] =~ (/\W/)
          i -= 1
        else
          a << remaining_string.slice!(/^.{#{i+1}}/) # <-- seems dirty
          splitter.call(remaining_string, a)
        end
      end 
    end 

    return a
  end
  
  tweets = []

  splitter.call(s, tweets)
end

# apparently ARGV strings are immutable
input = ARGV.shift.dup
p split_encapsulation(input)
