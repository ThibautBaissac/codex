class AnnotationsController < ApplicationController
  def index
    @writing = Writing.find(params[:writing_id])
  end

  def new
    @annotation = Annotation.new
    @writing = Writing.find(params[:writing_id])
  end

  def create
    authorize Annotation
    @annotation = Annotation.new(annotation_params)
    @annotation.user = current_user
    if @annotation.save
      flash[:notice] = t("annotations.flash.create.success")
    else
      flash[:alert] = t("annotations.flash.create.failure")
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    @writing = Writing.find(params[:writing_id])
    @annotation = Annotation.find(params[:id])
  end

  def update
    @annotation = Annotation.find(params[:id])
    if @annotation.update(annotation_params)
      flash[:notice] = t("annotations.flash.update.success")
    else
      flash[:alert] = t("annotations.flash.update.failure")
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def annotation_params
    params.require(:annotation).permit(:annotatable_id, :content).merge(
      annotatable_type: params[:annotation][:annotatable_type].capitalize.constantize
    )
  end
end
