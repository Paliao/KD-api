class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]
  before_action :ratings_count
  def index
    @ratings = Rating.all

    render json: @ratings
  end

  def show
    render json: @rating
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def update
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rating.destroy
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(
      :avaliations, :avaliations_count, :advertise_id, :establishment_id
    )
  end
end
