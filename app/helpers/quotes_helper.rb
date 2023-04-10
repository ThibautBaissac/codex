module QuotesHelper
  def popular_label(quote)
    quote.popular? ? 'Populaire' : 'Savante'
  end

  def with_influence_label(quote)
    quote.with_influence? ? 'Avec influence' : 'Sans influence'
  end

  def category_label(quote)
    quote.category.map { |c| t("quotes.category.#{c.downcase}") }.join(', ')
  end
end
