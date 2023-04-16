class QuotesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_quote, only: %i[edit update destroy]
  before_action :set_mouvement, only: %i[create update destroy]

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def edit
    authorize @quote
  end

  def create
    @quote = Quote.new(quote_params)
    authorize @quote
    @quote.category = quote_params[:category].reject(&:blank?)
    if @quote.save
      MouvementQuote.create!(mouvement: @mouvement, quote: @quote)
      redirect_to work_path(@mouvement.work), notice: "Quote was successfully created."
    else
      render :new
    end
  end

  def update
    authorize @quote
    @quote.category = quote_params[:category].reject(&:blank?)
    if @quote.update(quote_params.except(:category))
      redirect_to work_path(@mouvement.work), notice: "Quote was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @quote
    @quote.destroy
    redirect_to work_url(@mouvement.work), notice: "Quote was successfully destroyed."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def set_mouvement
    @mouvement = Mouvement.find(params[:mouvement_id])
  end

  def quote_params
    params.require(:quote).permit(
      :title,
      :description,
      :history,
      :popular,
      :with_influence,
      category: [],
      instrumentation: []
    )
  end
end
