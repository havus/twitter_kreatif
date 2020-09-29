# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_29_115424) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "twitter_user_id"
    t.string "screen_name"
    t.string "name"
    t.string "profile_image_url"
    t.string "oauth_token"
    t.string "oauth_token_secret"
    t.integer "classification", default: 0
    t.integer "ticket_remaining", default: 0
    t.index ["twitter_user_id"], name: "index_users_on_twitter_user_id", unique: true
  end

end
