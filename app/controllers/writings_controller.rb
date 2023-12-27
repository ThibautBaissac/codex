class WritingsController < ApplicationController
  def update
    @writing = Writing.find(params[:id])
    @artist = @writing.artist
    if @writing.update(writing_params)
      respond_with_update
    else
      redirect_back_with_error
    end
  end

  def search
    @artist = Artist.find(params[:artist_id]).decorate
    @writings = Writings::Finder.call(params: search_params, artist: @artist).result

    @years = @artist.years_of_writings
    @tags = @writings.tags_for_display

    @pagy, @writings = pagy(@writings, items: 20)
    render "artists/show"
  end

  private

  def writing_params
    params.require(:writing).permit(:date, :content)
  end

  def search_params
    params.permit(:q, :year)
  end

  def respond_with_update
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: "Writing updated") }
      format.turbo_stream
    end
  end

  def redirect_back_with_error
    redirect_back(fallback_location: root_path, alert: "Something went wrong")
  end
end
