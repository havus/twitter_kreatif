# frozen_string_literal: true

module API
  module V1
    class BaseController < ActionController::Base
      def resource_serializer
        class_name = controller_name.split('/').last.camelize.singularize

        "::V1::#{class_name}Serializer".constantize
      end
    end
  end
end
