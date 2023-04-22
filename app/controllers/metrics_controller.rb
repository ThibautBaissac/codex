class MetricsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    Element.category_values.each do |category|
      instance_variable_set("@elements_#{category.downcase}", Element.with_category(category))
    end
  end
end
