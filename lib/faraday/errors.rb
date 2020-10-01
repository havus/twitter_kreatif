# frozen_string_literal: true

module TwitterKreatif
  class Error < StandardError; end

  class InvalidRequest      < Error; end
  class InvalidAccessToken  < Error; end
  class ResourceNotFound    < Error; end
  class InvalidParameter    < Error; end
  class InternalServerError < Error; end

  class OpenTimeout < Error; end
  class ReadTimeout < Error; end
end
