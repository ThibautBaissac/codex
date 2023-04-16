class MetricsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    Quote.category_values.each do |category|
      instance_variable_set("@quotes_#{category.downcase}", Quote.with_category(category))
    end
  end
end
