class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def up
    create_enum :user_roles, ["user", "admin", "super_admin"]
    change_table :users do |t|
      t.enum :role, enum_type: "role", default: "user", null: false
    end
  end
end
