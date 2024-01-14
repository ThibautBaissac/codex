class ArtistDecorator < SimpleDelegator
  def fullname
    "#{firstname&.capitalize}  #{lastname&.capitalize}"
  end

  def biography
    bio.present? ? bio : "No bio available"
  end
end
