module Authentication
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[new create]

    def new
    end

    def create
      if (user = User.authenticate_by(email: params[:email], password: params[:password]))
        login(user)
        redirect_to root_path, notice: t("authentication.logged_in")
      else
        flash[:alert] = t("authentication.invalid_credentials")
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      logout(current_user)
      redirect_to new_authentication_session_path, notice: t("authentication.logged_out")
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
