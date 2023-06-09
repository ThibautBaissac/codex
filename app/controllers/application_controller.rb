class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  skip_before_action :authenticate_user!, only: [:search]

  def authenticate_user!
    if current_user.nil?
      session[:user_id] = nil
      redirect_to new_session_path, status: 301
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def search
    return render :search unless params[:q].present?

    @params = params
    q = params[:q]&.downcase

    @works = Work.where("lower(title) LIKE :q OR lower(description) LIKE :q", {q: "%#{q}%"} )
    @elements = Element.where("lower(title) LIKE :q OR lower(description) LIKE :q", {q: "%#{q}%"})

    @works = @works.or(Work.where("opus = ?", q)) if q.to_i.to_s == q

    @works.distinct!
    @elements.distinct!
    render :search
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
