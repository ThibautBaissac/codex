class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_enum :user_roles, %w[user admin super_admin]

    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.enum :role, enum_type: "user_roles", default: "user", null: false

      t.timestamps
    end
  end
end
