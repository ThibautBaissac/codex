class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users do |t|
      t.string "email", null: false
      t.string "firstname"
      t.string "lastname"
      t.string "password_digest", null: true
      t.string "token", null: false
      t.string "refresh_token", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["refresh_token"], name: "index_users_on_refresh_token", unique: true
      t.index ["token"], name: "index_users_on_token", unique: true
      t.timestamps
    end
  end
end
