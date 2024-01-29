class TagsController < ApplicationController
  before_action :set_taggable

  def create
    authorize Tag
    if @taggable.add_tag(tag_params[:name])
      handle_response_with_flash(:create)
    else
      redirect_back(fallback_location: root_path, alert: t("tags.flash.create.failure"))
    end
  end

  def destroy
    authorize Tag
    if @taggable.remove_tag(params[:id])
      handle_response_with_flash(:destroy)
    else
      redirect_back(fallback_location: root_path, alert: t("tags.flash.destroy.failure"))
    end
  end

  private

  def set_taggable
    @taggable = taggable_class.find_by(id: taggable_id)
    return if @taggable

    redirect_to root_path, alert: t("tags.flash.not_found")
  end

  def taggable_class
    params[:taggable_type].capitalize.constantize
  end

  def taggable_id
    params["#{params[:taggable_type].downcase}_id"]
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def handle_response_with_flash(action)
    flash[:notice] = t("tags.flash.#{action}.success")
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end
end
