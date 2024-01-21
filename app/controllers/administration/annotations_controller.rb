class Administration::AnnotationsController < ApplicationController
  def index
    @pagy, @annotations = pagy(Annotation.all.includes(:rich_text_content, :user).order(updated_at: :desc), items: 2)
  end

  def edit
    @annotation = Annotation.find(params[:id])
    @writing = @annotation.annotatable
  end
end
