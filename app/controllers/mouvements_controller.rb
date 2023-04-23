class MouvementsController < ApplicationController
  before_action :set_mouvement, only: %i[edit update destroy add_selected_element remove_selected_element]

  def edit
    authorize @mouvement
  end

  def create
    @mouvement = Mouvement.new(mouvement_params)
    authorize @mouvement

    @mouvement.work = Work.find(params[:work_id])
    if @mouvement.save!
      redirect_to work_path(@mouvement.work), notice: "Mouvement was successfully created."
    else
      render :new
    end
  end

  def update
    authorize @mouvement
    if @mouvement.update!(mouvement_params)
      redirect_to work_path(@mouvement.work), notice: "Mouvement was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @mouvement
    @mouvement.destroy
    redirect_to work_path(@mouvement.work), notice: "Mouvement was successfully destroyed."
  end

  def add_selected_element
    authorize @mouvement
    element = Element.find(params[:element_id])
    @mouvement.elements << element
    redirect_to work_path(@mouvement.work), notice: "Element was successfully added."
  end

  def remove_selected_element
    authorize @mouvement
    element = Element.find(params[:element_id])
    @mouvement.elements.delete(element)
    redirect_to work_path(@mouvement.work), notice: "Element was successfully removed."
  end

  private

  def set_mouvement
    @mouvement = Mouvement.find(params[:id])
  end

  def mouvement_params
    params.require(:mouvement).permit(
      :number,
      :title,
      :dedication,
      :start_date,
      :end_date
    )
  end
end
