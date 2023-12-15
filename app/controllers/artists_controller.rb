class ArtistsController < ApplicationController
  def index
    @pagy, @artists = pagy(Artist.all)
  end
end
