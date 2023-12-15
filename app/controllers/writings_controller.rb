class WritingsController < ApplicationController
  def search
    @artist = Artist.find(params[:artist_id]).decorate
    @writings = @artist.writings.joins(:rich_text_content)
                       .where("action_text_rich_texts.body LIKE ?", "%#{params[:q]}%")

    # search_terms = params[:q].to_s.downcase.split
    # query = search_terms.map { |term| "LOWER(action_text_rich_texts.body) LIKE '%#{term}%'" }.join(' OR ')
    # @writings = @artist.writings.joins(:rich_text_content).where(query)
    @pagy, @writings = pagy(@writings, items: 20)
    render "artists/show"
  end
end
