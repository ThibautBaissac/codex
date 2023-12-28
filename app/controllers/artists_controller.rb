class ArtistsController < ApplicationController
  def index
    @pagy, @artists = pagy(Artist.all)
  end

  def show
    @artist = load_artist
  end

  private

  def load_artist
    @artist = Artist.find(params[:id]).decorate
  end
end
