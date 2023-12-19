class WritingsController < ApplicationController

  def update
    @writing = Writing.find(params[:id])
    if @writing.update!(writing_params)
      redirect_back(fallback_location: root_path, notice: "Writing updated")
    else
      redirect_back(fallback_location: root_path, alert: "Someting went wrong")
    end
  end

  def search
    @artist = Artist.find(params[:artist_id]).decorate
    @writings = @artist.writings.joins(:rich_text_content)
                       .where("action_text_rich_texts.body LIKE ?", "%#{params[:q]}%")
                       .order(date: :asc)
    @tags = @writings.includes(:tags).map(&:tags).flatten.uniq.sort_by(&:name)

    # search_terms = params[:q].to_s.downcase.split
    # query = search_terms.map { |term| "LOWER(action_text_rich_texts.body) LIKE '%#{term}%'" }.join(' OR ')
    # @writings = @artist.writings.joins(:rich_text_content).where(query)

    @pagy, @writings = pagy(@writings, items: 20)
    render "artists/show"
  end

  private

  def writing_params
    params.require(:writing).permit(:date, :content)
  end
end
