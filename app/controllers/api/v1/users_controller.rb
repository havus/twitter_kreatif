# frozen_string_literal: true

module API
  module V1
    class UsersController < BaseController
      skip_before_action :verify_authenticity_token, only: [:create, :coba]

      def request_token
        service = TokenRequestor.new
        service.perform

        render status: :ok, json: { oauth_token: service.output }.to_json
      end

      def create
        service = UserCreator.new
        service.perform(oauth_token: params[:oauth_token], oauth_verifier: params[:oauth_verifier])

        if service.errors.blank?
          render status: :ok, json: { user: service.output }.to_json
        else
          render status: :unauthorized, json: { error_messages: service.errors.join(', ') }.to_json
        end
      end
    end
  end
end
