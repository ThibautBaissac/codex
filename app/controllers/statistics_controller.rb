class StatisticsController < ApplicationController
  def greif_writings_by_year_chart
    render json: Artist.find_by_lastname("Greif").writings.group_by_year(:date, format: "%Y").count
  end

  def tags_by_name_chart
    render json: Tagging.joins(:tag).group("tags.name").count
  end
end
