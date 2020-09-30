# frozen_string_literal: true

module API
  module V1
    class UsersController < BaseController
      def request_token
        service = TokenRequestor.new
        service.perform

        render status: :ok, json: { oauth_token: service.output }.to_json
      end
    end
  end
end
