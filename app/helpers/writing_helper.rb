module WritingHelper
  def render_writing_annotations(writing)
    render partial: 'annotations/list', collection: writing.annotation_list, as: :annotation
  end
end
