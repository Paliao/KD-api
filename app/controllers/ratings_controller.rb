class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]
  after_action :ratings_treatment, only: [:create]

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
      :avaliation, :advertise_id, :establishment_id
    )
  end

  def ratings_treatment
    advertise_id = @rating.advertise_id
    if advertise_id.present?
      advertise = Advertise.find(advertise_id)
      rating_count_increase(advertise)
      rating_average(advertise)
    else
      establishment = Establishment.find(@rating.establishment_id)
      rating_count_increase(establishment)
      rating_average(establishment)
    end
  end

  def rating_count_increase(model)
    model.rating_count += 1
    model.save!
  end

  def rating_average(model)
    new_rating = model.rating * model.rating_count
    new_rating += @rating.avaliation
    new_rating /= model.rating_count
    model.rating = new_rating
    model.save!
  end
end
