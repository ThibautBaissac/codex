class ElementsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_element, only: %i[update]
  before_action :set_object, only: %i[create update]

  def show
    @element = Element.find(params[:id])
  end

  def new
    @element = Element.new
    authorize @element
  end

  def create
    @element = Element.new(element_params)
    authorize @element
    @element.category = element_params[:category].reject(&:blank?)
    if @element.save
      create_object_element
      flash[:notice] = "Element was successfully created."
    else
      flash[:alert] = @element.errors.full_messages.join(", ")
    end
    redirection
  end

  def update
    authorize @element
    @element.category = element_params[:category].reject(&:blank?)
    if @element.update(element_params.except(:category))
      flash[:notice] = "Element was successfully created."
    else
      # raise
      flash[:alert] = @element.errors.full_messages.join(", ")
    end
    redirection
  end

  private

  def set_element
    @element = Element.find(params[:id])
  end

  def set_object
    if params[:object_type] == "work"
      @object = Work.find(params[:object_id])
    else
      @object = Mouvement.find(params[:object_id])
    end
  end

  def create_object_element
    if params[:object_type] == "work"
      WorkElement.create!(work: @object, element: @element)
    else
      MouvementElement.create!(mouvement: @object, element: @element)
    end
  end

  def redirection
    if params[:object_type] == "work"
      redirect_to work_path(@object)
    else
      redirect_to work_path(@object.work)
    end
  end

  def element_params
    params.require(:element).permit(
      :title,
      :description,
      :popular,
      :with_influence,
      :extract,
      :extract_size,
      category: [],
      instrumentation: []
    )
  end
end
