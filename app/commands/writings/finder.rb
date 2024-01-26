module Writings
  class Finder
    prepend SimpleCommand

    def initialize(params:, artist:)
      @params = params
      @artist = artist
    end

    def call
      return [] if @params.blank? || @artist.blank?

      set_params
      filter_writings
      @writings.distinct.order(date: :asc)
    end

    private

    def set_params
      @query_param = "%#{@params[:q]}%"
      @year_param = @params[:year]
      @tags_param = @params[:tags]
    end

    def filter_writings
      @writings = @artist.writings.joins(:rich_text_content)
      @writings = filter_query if @query_param.present?
      @writings = filter_by_year if @year_param.present?
      @writings = filter_by_tags if @tags_param.present?
    end

    def filter_query
      @writings.search_by_content(@query_param)
    end

    def filter_by_year
      start_of_year = Date.new(@year_param.to_i, 1, 1)
      end_of_year = Date.new(@year_param.to_i, 12, 31)
      @writings.where(date: start_of_year..end_of_year)
    end

    def filter_by_tags
      @writings.joins(:tags).where(tags: {id: @tags_param})
    end
  end
end
