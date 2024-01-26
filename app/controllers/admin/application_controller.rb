# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      return unless current_admin.nil?

      flash[:alert] = "Please sign in with a super_admin account to access this page"
      redirect_to root_path
    end

    def scoped_resource
      resource_class.order(created_at: :asc)
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private

    def current_admin
      @current_admin ||= User.where(role: "super_admin").first
    end
  end
end
