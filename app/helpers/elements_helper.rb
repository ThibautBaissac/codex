module ElementsHelper
  def popular_label(element)
    element.popular? ? 'Populaire' : 'Savant'
  end

  def with_influence_label(element)
    return unless element.with_motif?
    return if element.with_influence.nil?
    element.with_influence? ? 'Avec influence' : 'Sans influence'
  end

  def category_label(element)
    element.category.map { |c| t("elements.category.#{c.downcase}") }.join(', ')
  end
end
