class SourceDecorator < SimpleDelegator
  def cover_image
    source_images.find_by(is_cover: true).try(:file)
  end
end
