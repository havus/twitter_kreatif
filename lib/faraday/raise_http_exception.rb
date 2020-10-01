# frozen_string_literal: true

require 'faraday'

module FaradayMiddleware
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 400
          raise TwitterKreatif::InvalidRequest, response.body
        when 401
          raise TwitterKreatif::InvalidAccessToken, response.body
        when 404
          raise TwitterKreatif::ResourceNotFound, response.body
        when 422
          raise TwitterKreatif::InvalidParameter, response.body
        when 500
          raise TwitterKreatif::InternalServerError, response.body
        end
      end
    rescue Faraday::ConnectionFailed
      raise TwitterKreatif::OpenTimeout, 'Twitter API takes too long to accept connection'
    rescue Faraday::TimeoutError
      raise TwitterKreatif::ReadTimeout, 'Twitter API takes too long to render response'
    end

    def initialize(app)
      super app
      @parser = nil
    end

  private
    def error_message(response)
      "#{response[:method].upcase} #{response[:url]}: #{response[:status]}#{error_body(response[:body])}"
    end

    def error_body(body)
      body = ::JSON.parse(body) if !body.nil? && !body.empty? && body.kind_of?(String)

      body.nil? ? nil : ": #{body['message']}"
    end
  end
end
