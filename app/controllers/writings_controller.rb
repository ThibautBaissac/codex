class WritingsController < ApplicationController
  before_action :load_artist, only: %i[index edit search]
  before_action :load_years, only: %i[index search]
  before_action :load_tags, only: %i[index search]

  def index
    @pagy, @writings = pagy(@artist.writings.includes([:rich_text_content, :annotations]).order(date: :asc), items: 20)
  end

  def new
    @writing = Writing.new
    @artist = Artist.find(params[:artist_id])
    authorize @writing
  end

  def create
    authorize Writing
    @writing = Writing.new(writing_params)
    @artist = Artist.find(params[:artist_id])
    @writing.artist = @artist
    if @writing.save
      flash[:notice] = t("writings.flash.create.success")
      redirect_back(fallback_location: root_path)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @writing = Writing.find(params[:id])
    authorize @writing
  end

  def search
    @writings = Writings::Finder.call(params: search_params, artist: @artist).result
    @pagy, @writings = pagy(@writings, items: 20)
    render :index
  end

  def update
    @writing = Writing.find(params[:id])
    authorize @writing
    @artist = @writing.artist
    if @writing.update(writing_params)
      flash[:notice] = t("writings.flash.update.success")
      respond_with_update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def load_artist
    @artist = Artist.find(params[:artist_id]).decorate
  end

  def load_years
    @years = @artist.years_of_writings
  end

  def load_tags
    @tags = @artist.writings.tags_for_display
  end

  def writing_params
    params.require(:writing).permit(:date, :content)
  end

  def search_params
    params.permit(:q, :year, tags: [])
  end

  def respond_with_update
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end
end
