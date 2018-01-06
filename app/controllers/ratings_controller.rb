class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]
  after_action :ratings_treatment, only: [:create, :update]

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
    remove_old_rating
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def destroy
    remove_old_rating
    @rating.destroy
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def ratings_treatment
    chosed_model = rating_model_chooser(@rating)
    rating_average(chosed_model)
  end

  def rating_average(model)
    new_rating = model.rating * model.rating_count
    model.rating_count += 1
    new_rating += @rating.avaliation
    new_rating /= model.rating_count
    model.rating = new_rating
    model.save!
  end

  def remove_old_rating
    old_rating = @rating.avaliation
    chosed_model = rating_model_chooser(@rating)
    delete_previous_rating(chosed_model, old_rating)
  end

  def delete_previous_rating(model, old_rating)
    aggregated = model.rating * model.rating_count
    aggregated -= old_rating
    model.rating_count -= 1
    aggregated /= model.rating_count unless model.rating_count.zero?
    model.rating = aggregated
    model.save!
  end

  def rating_model_chooser(rating)
    if rating.advertise_id
      Advertise.find(rating.advertise_id)
    elsif rating.combo_id
      Combo.find(rating.combo_id)
    elsif rating.event_id
      Event.find(rating.event_id)
    elsif rating.product_id
      Product.find(rating.product_id)
    else
      Establishment.find(rating.establishment_id)
    end
  end

  def rating_params
    params.require(:rating).permit(
      :avaliation, :advertise_id, :combo_id,
      :establishment_id, :event_id, :product_id
    )
  end
end
