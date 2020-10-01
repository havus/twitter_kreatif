# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require "#{Rails.root}/lib/faraday/raise_http_exception.rb"
require "#{Rails.root}/lib/faraday/errors.rb"

class UserCreator
  def initialize
    @output = nil
    @errors = []
  end

  attr_reader :output, :errors

  def perform(oauth_token:, oauth_verifier:)
    conn = Faraday.new(url: 'https://api.twitter.com') do |faraday|
      faraday.use FaradayMiddleware::RaiseHttpException
      faraday.adapter Faraday.default_adapter
    end

    url = '/oauth/access_token'
    url += "?oauth_token=#{oauth_token}"
    url += "&oauth_verifier=#{oauth_verifier}"

    response  = conn.post url
    @output   = response.body

    true
  rescue => error
    case error
    when TwitterKreatif::InvalidAccessToken
      @errors << error.message
    end

    false
  end
end
