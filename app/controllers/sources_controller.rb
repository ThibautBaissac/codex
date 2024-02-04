class SourcesController < ApplicationController
  before_action :set_artist, only: %i[index new create edit]
  before_action :set_source, only: %i[edit update]
  before_action :authorize_source, only: %i[new create edit update]

  layout "full_width", only: %i[index show]

  def index
  end

  def show
    @source = Source.find(params[:id])
    set_source_images
  end

  def new
    @source = Source.new
    @source.source_images.build
  end

  def create
    @source = @artist.sources.new(source_params)
    if @source.save
      handle_response_with_flash(:create)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @source.source_images.build
  end

  def update
    command = Sources::Update.call(source: @source, source_params:)
    if command.success?
      set_source_images
      handle_response_with_flash(:update)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_artist
    @artist = Artist.find_by(slug: params[:artist_id])
  end

  def set_source
    @source = Source.find(params[:id])
  end

  def set_source_images
    @source_images = @source.source_images.includes([{file_attachment: :blob}, :rich_text_description])
  end

  def authorize_source
    authorize @source || Source.new
  end

  def source_params
    params.require(:source).permit(:name, :description,
                                   source_images_attributes: %i[id file description is_cover _destroy])
  end

  def handle_response_with_flash(action)
    flash[:notice] = t("sources.flash.#{action}.success")
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end
end
