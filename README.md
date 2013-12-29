pipe-tweet
==========

Run a command; tweet its output.

## Instructions


- Step 0. bundle install
- Step 1. Create a file in the program directory called twitter.yml, with the format:

```
TWITTER_CONSUMER_KEY:    $YOUR_CONSUMER_KEY  
TWITTER_CONSUMER_SECRET: $YOUR_CONSUMER_SECRET  
OAUTH_TOKEN:             $YOUR_OAUTH_TOKEN  
OAUTH_TOKEN_SECRET:      $YOUR_OAUTH_TOKEN_SECRET  
```


- Step 2. Run a UNIX command, and pipe its output into tweet.rb, like so:

```
cat your/file.txt | ruby tweet.rb -i 7
```

```
Run a command; tweet its output

    Usage: pipetweet.rb [options]
    
    -i, --interval INTERVAL          Interval between tweets (default=15)
```

- Step 3. ???
- Step 4. Profit!
