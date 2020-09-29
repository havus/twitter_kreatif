class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.bigint  :twitter_user_id
      t.string  :screen_name
      t.string  :name
      t.string  :profile_image_url
      t.string  :oauth_token
      t.string  :oauth_token_secret
      t.integer :classification, default: 0
      t.integer :ticket_remaining, default: 0
    end

    add_index :users, :twitter_user_id, unique: true
  end
end
