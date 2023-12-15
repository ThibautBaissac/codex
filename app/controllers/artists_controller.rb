class ArtistsController < ApplicationController
  def index
    @pagy, @artists = pagy(Artist.all)
  end

  def show
    @artist = Artist.find(params[:id]).decorate
    @pagy, @writings = pagy(@artist.writings, items: 20)
  end
end
