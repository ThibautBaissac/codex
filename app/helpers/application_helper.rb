module ApplicationHelper
  include Pagy::Frontend

  def on_page?(controller_name, action_name)
    params[:controller] == controller_name && params[:action] == action_name
  end

  def determine_modal_type_and_icon
    if user_signed_in?
      ["edit", "edit"]
    else
      ["show", "eye"]
    end
  end
end
