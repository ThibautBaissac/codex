class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_concert, only: %i[show update]

  def index
    @concerts = Concert.all.order(date: :desc)
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    if @concert.save
      redirect_to concerts_path, notice: "Concert was successfully created."
    else
      render :index
    end
  end

  def update
    if @concert.update(concert_params)
      redirect_to concert_path(@concert), notice: "Concert was successfully updated."
    else
      render :show
    end
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(
      :date,
      :time,
      :location,
      :artists,
      :program,
      :notes
    )
  end
end
