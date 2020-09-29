# frozen_string_literal: true

class User < ApplicationRecord
  # from audited gem for versioning
  audited
  has_associated_audits

  # --- Validate Presence --- #
  validates_presence_of :twitter_user_id, :screen_name
end
