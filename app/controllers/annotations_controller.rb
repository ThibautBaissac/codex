class AnnotationsController < ApplicationController
  def create
    authorize Annotation
    @annotation = Annotation.new(annotation_params)
    @annotation.user = current_user
    @annotation.save
    redirect_back(fallback_location: root_path, notice: 'Annotation was successfully created.')
  end

  private

  def annotation_params
    params.require(:annotation).permit(:annotatable_id, :content).merge(
      annotatable_type: params[:annotation][:annotatable_type].capitalize.constantize
    )
  end
end
