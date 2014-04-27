require 'eventbrite-client'

eb_auth_tokens = { app_key: ENV['EBAT']}
eb_client = EventbriteClient.new(eb_auth_tokens)


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['T_KEY']
  config.consumer_secret     = ENV['T_SECRET']
  config.access_token        = ENV['TAC']
  config.access_token_secret = ENV['TACS']
end
