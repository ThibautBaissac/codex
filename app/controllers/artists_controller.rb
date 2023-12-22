class ArtistsController < ApplicationController
  def index
    @pagy, @artists = pagy(Artist.all)
  end

  def show
    @artist = load_artist
    @tags = load_tags
    @pagy, @writings = pagy_ordered_writings
  end

  private

  def load_artist
    Artist.find(params[:id]).decorate
  end

  def load_tags
    tagging_ids = Tagging.where(taggable_type: 'Writing', taggable_id: @artist.writings.select(:id)).pluck(:tag_id)
    Tag.where(id: tagging_ids).order(:name)
  end

  def pagy_ordered_writings
    pagy(@artist.writings.order(date: :asc), items: 20)
  end
end
