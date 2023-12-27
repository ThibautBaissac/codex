module Writings
  class Finder
    prepend SimpleCommand

    def initialize(params:, artist:)
      @params = params
      @artist = artist
    end

    def call
      return [] if @params.blank? || @artist.blank?

      filter_writings
      @writings.order(date: :asc)
    end

    private

    def filter_writings
      @writings = @artist.writings.joins(:rich_text_content)
                         .where("action_text_rich_texts.body LIKE ?", query_param)

      @writings = filter_query if query_param_present?
      @writings = filter_by_year if year_param_present?
    end

    def query_param
      "%#{@params[:q]}%"
    end

    def year_param_present?
      @params[:year].present?
    end

    def query_param_present?
      @params[:q].present?
    end

    def filter_by_year
      start_of_year = Date.new(@params[:year].to_i, 1, 1)
      end_of_year = Date.new(@params[:year].to_i, 12, 31)
      @writings.where(date: start_of_year..end_of_year)
    end

    def filter_query
      @writings.joins(:rich_text_content)
               .where("action_text_rich_texts.body LIKE ?", query_param)
    end

  end
end
