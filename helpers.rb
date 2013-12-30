def split(tweets=[], text)
  return tweets << text if text.length < 140
  text.gsub!("\r\n", "")
  i = 139
  while i > 0
    return split(tweets << text.slice!(/(.{,#{i}}\b)/), text) if text[i] =~ (/\W/)
    i -= 1
  end
end
