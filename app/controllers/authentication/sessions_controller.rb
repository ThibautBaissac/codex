module Authentication
  class SessionsController < ApplicationController
    def new
    end

    def create
      if (user = User.authenticate_by(email: params[:email], password: params[:password]))
        login(user)
        redirect_to root_path, notice: 'Logged in!'
      else
        flash[:alert] = 'Email or password is invalid'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      logout(current_user)
      redirect_back(fallback_location: root_path, notice: 'Logged out!')
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
