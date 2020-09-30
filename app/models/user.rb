# frozen_string_literal: true

# This model has the following table columns:
# t.bigint "twitter_user_id"
# t.string "screen_name"
# t.string "name"
# t.string "profile_image_url"
# t.string "oauth_token"
# t.string "oauth_token_secret"
# t.integer "classification", default: 0
# t.integer "ticket_remaining", default: 0

class User < ApplicationRecord
  # from audited gem for versioning
  audited
  has_associated_audits

  # --- Validate Presence --- #
  validates_presence_of :twitter_user_id, :screen_name
end
