class WorksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_work, only: %i[show edit update destroy add_selected_element remove_selected_element]

  def index
    @works = Work.all.order(:opus)
    @work = Work.new
  end

  def new
    @work = Work.new
    authorize @work
  end

  def show
    @new_mouvement = Mouvement.new
    @element = Element.new
    authorize @work
  end

  def edit
    authorize @work
  end

  def create
    @work = Work.new(work_params)
    authorize @work
    if @work.save
      redirect_to works_path, notice: "Work was successfully created."
    else
      render :index
    end
  end

  def update
    authorize @work
    if @work.update(work_params)
      redirect_to work_path(@work), notice: "Work was successfully updated."
    else
      render :show
    end
  end

  def destroy
    authorize @work
    @work.destroy
    redirect_to works_path, notice: "Work was successfully destroyed."
  end

  def add_selected_element
    authorize @work
    element = Element.find(params[:element_id])
    @work.elements << element
    redirect_to work_path(@work), notice: "Element was successfully added."
  end

  def remove_selected_element
    authorize @work
    element = Element.find(params[:element_id])
    @work.elements.delete(element)
    redirect_to work_path(@work), notice: "Element was successfully removed."
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(
      :title,
      :opus,
      :description,
      instrumentation: []
    )
  end
end
