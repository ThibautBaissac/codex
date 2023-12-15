class ArtistsPresenter
  def all_artists_with_writings
    Artist.includes(:writings).map(&:decorate)
  end
end
