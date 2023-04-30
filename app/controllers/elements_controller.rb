class ElementsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_element, only: %i[edit update destroy]
  before_action :set_mouvement, only: %i[create update destroy]

  def show
    @element = Element.find(params[:id])
  end

  def new
    @element = Element.new
    authorize @element
  end

  def edit
    authorize @element
  end

  def create
    @element = Element.new(element_params)
    authorize @element
    @element.category = element_params[:category].reject(&:blank?)
    if @element.save
      MouvementElement.create!(mouvement: @mouvement, element: @element)
      redirect_to work_path(@mouvement.work), notice: "Element was successfully created."
    else
      render :new
    end
  end

  def update
    authorize @element
    @element.category = element_params[:category].reject(&:blank?)
    if @element.update(element_params.except(:category))
      redirect_to work_path(@mouvement.work), notice: "Element was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_element
    @element = Element.find(params[:id])
  end

  def set_mouvement
    @mouvement = Mouvement.find(params[:mouvement_id])
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
