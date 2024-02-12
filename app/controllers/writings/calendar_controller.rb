module Writings
  class CalendarController < ApplicationController
    def index
      @artist = Artist.find_by_slug(params[:artist_id])
      @headers = month_year_headers(@artist.years_of_writings.first, @artist.years_of_writings.last)
      @writings_by_date = @artist.writings.each_with_object({}) do |writing, obj|
        obj[writing.date] ||= []
        obj[writing.date] << writing.id
      end
    end

    def show
      @artist = Artist.find_by_slug(params[:artist_id])
      @writing = @artist.writings.find(params[:id])
    end

    private

    def month_year_headers(start_year, end_year)
      headers = []
      (start_year..end_year).each do |year|
        (1..12).each do |month|
          formatted_month = format("%02d", month)
          headers << "#{formatted_month}-#{year}"
        end
      end
      headers
    end
  end
end
