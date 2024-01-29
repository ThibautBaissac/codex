module BaseControllerHelper
  def sign_in_as(user)
    Current.user = user
    session[:user_id] = user.id
  end
end
