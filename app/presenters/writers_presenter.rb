class WritersPresenter
  def all_writers_with_writings
    Writer.includes(:writings).map(&:decorate)
  end
end
