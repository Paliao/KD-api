class DaysController < ApplicationController
  before_action :set_day, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @days = Day.all

    render json: @days.as_json(include: [:combos, :events, :products])
  end

  def show
    render json: @day.as_json(include: [:combos, :events, :products])
  end

  def create
    @day = Day.new(day_params)
    establishment_id = @day.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @day.save
        render json: @day, status: :created, location: @day
      else
        render json: @day.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @day.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @day.update(day_params)
        render json: @day
      else
        render json: @day.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @day.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @day.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(
      :name, :available, :available_hour, :unavailable_hour,
      :establishment_id
    )
  end
end
