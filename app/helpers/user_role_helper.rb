module UserRoleHelper
  def user_super_admin?
    current_user&.role_super_admin?
  end
end
