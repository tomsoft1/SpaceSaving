require 'bundler/setup'
require 'tweetstream'
require './SpaceSaving.rb'


# Please put your own credential here
TweetStream.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.oauth_token        = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_SECRET
  config.auth_method        = :oauth
end

@client=TweetStream::Client.new;

urls=SpaceSaving.new

total=0

@client.track('http') do |status|
  begin
    # add each URL in the tweet , and count it once
    status.urls.each do |url|
     urls.add_entry(url.expanded_url,1)
    end
    total+=1
    if total%1000==0 then
      puts "Treated:#{total}"
      limit=urls.counts.values.sort[-30]
      urls.counts.each do|u,c|
        if c>limit 
          puts "Counts #{c} #{u} errors:#{urls.errors[u]}"
        end
      end
    end
  end
end