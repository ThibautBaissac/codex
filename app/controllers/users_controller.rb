class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]).decorate
    authorize @user
  end

  def edit
    @user = User.find(params[:id]).decorate
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: t("users.flash.update.success")
    else
      respond_to do |format|
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname)
  end
end
