# frozen_string_literal: true

class TokenRequestor
  def initialize
    @output = nil
    @errors = []
  end

  attr_reader :output, :errors

  def perform
    callback_url    = "#{ENV['CLIENT_BASE_URL']}/api/v1/users/access_token"
    oauth_consumer  = ::OAuth::Consumer.new(
      ENV['TWITTER_CONSUMER_KEY'],
      ENV['TWITTER_CONSUMER_SECRET'],
      site: 'https://api.twitter.com'
    )
    request_token = oauth_consumer.get_request_token(oauth_callback: callback_url)

    @output = request_token.token

    true
  end
end
