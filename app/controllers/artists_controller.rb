class ArtistsController < ApplicationController
  before_action :load_artist, only: %i[show edit update]

  def index
    @pagy, @artists = pagy(Artist.includes([:rich_text_bio]).all)
  end

  def show; end

  def edit
    authorize @artist
  end

  def update
    authorize @artist
    if @artist.update(artists_params)
      respond_with_update
    else
      redirect_back(fallback_location: root_path, alert: t("artists.flash.update.failure"))
    end
  end

  private

  def load_artist
    @artist = Artist.find(params[:id]).decorate
  end

  def artists_params
    params.require(:artist).permit(:firstname, :lastname, :birthdate, :deathdate, :bio)
  end

  def respond_with_update
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: t("artists.flash.update.success")) }
      format.turbo_stream
    end
  end
end
