require 'bundler/setup'
require 'tweetstream'
require './SpaceSaving.rb'

TweetStream.configure do |config|
  config.consumer_key       = 'TgfLyTHk9RzZSK9yeQpq9w'
  config.consumer_secret    = 'fzRTu2PCfThY5i1GhikHopxXIBwRItQ69CQfZLUP0'
  config.oauth_token        = '1392362588-Vmm39WRQu6kGN4PDCLjk32VuInh3P8fIBBCYL2d'
  config.oauth_token_secret = 'aSjyPRnFKtBj2jNYmIwZmkEEMEOsud0vBBhbYxQgDo'
  config.auth_method        = :oauth
end

# Use 'track' to track a list of single-word keywords
total=0

@client=TweetStream::Client.new;

urls=SpaceSaving.new

@client.track('http') do |status|
  begin
  status.urls.each do |url|
     # SpaceSavingalgo
     urls.add_entry(url.expanded_url,1)
  end
  total+=1
  if total%1000==0 then
     puts "Treated:#{total}"
     limit=urls.counts.values.sort[-30]
     urls.counts.each do|u,c|
        if c>limit then 
          puts "Counts #{c} #{u} errors:#{urls.errors[u]}"
        end
     end
    end
  
  rescue Exception =>e
   puts e
  end
end