module Administration
  class AnnotationsController < ApplicationController
    def index
      @pagy, @annotations = pagy(
        Annotation.where(user: current_user).includes(:rich_text_content, :user).order(updated_at: :desc), items: 20
      )
    end

    def edit
      @annotation = Annotation.find(params[:id])
      @writing = @annotation.annotatable
    end
  end
end
