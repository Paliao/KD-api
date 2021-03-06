class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :delete]
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
    @rating.user_id = current_user.id
    Rating.setting_owner(@rating)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def update
    remove_old_rating
    if owner?
      if @rating.update(rating_params)
        render json: @rating
      else
        render json: @rating.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    if owner?
      remove_old_rating
      @rating.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def owner?
    user_id = @rating.user_id
    current_user.id == user_id
  end

  # def already_avaliated?
  #   chosed_model = Rating.rating_model_chooser(@rating)

  # end

  def ratings_treatment
    chosed_model = Rating.rating_model_chooser(@rating)
    Rating.rating_average(chosed_model, @rating)
  end

  def remove_old_rating
    old_rating = @rating.avaliation
    chosed_model = Rating.rating_model_chooser(@rating)
    Rating.delete_previous_rating(chosed_model, old_rating)
  end

  def rating_params
    params.require(:rating).permit(
      :avaliation, :description,
      :advertise_id, :combo_id,
      :establishment_id, :event_id,
      :parking_id, :product_id,
      :user_id
    )
  end
end
