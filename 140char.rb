# potential features:
# 1. insert (1 of 3) markers, etc
# insert ellipis at end of each non-final tweet


# inputs <= 140 chars are returned as a string;
# inputs > 140 chars are returned as an array of strings

def split_encapsulation(s)
  if s.length <= 140
    return s
  end
 
  splitter = lambda do |remaining_string, a|
    # start at remaining_string[139], ie length=140
    # find the first word, and take from there to zero
    i = 139 
    # loop exits when remaining_string.length == 0,
    # and when loop exits array is returned 
    while i > 0
      unless remaining_string[i] =~ (/\W/)
        i -= 1
      else
        a << remaining_string.slice!(/^.{#{i+1}}/) # <-- seems dirty
        splitter.call(remaining_string, a)
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
