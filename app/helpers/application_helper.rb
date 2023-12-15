module ApplicationHelper
  include Pagy::Frontend

  def on_page?(controller_name, action_name)
    params[:controller] == controller_name && params[:action] == action_name
  end
end
