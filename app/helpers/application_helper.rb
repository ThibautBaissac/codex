module ApplicationHelper
  include Pagy::Frontend

  def on_page?(controller_name, action_name)
    params[:controller] == controller_name && params[:action] == action_name
  end

  def determine_modal_type_and_icon
    if on_page?("artists", "show") || on_page?("writings", "search") || on_page?("writings", "update")
      ["edit", "edit"]
    else
      ["show", "eye"]
    end
  end
end
