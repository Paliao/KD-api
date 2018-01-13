class DaysController < ApplicationController
  before_action :set_day, only: [:show, :update, :destroy]

  def index
    @days = Day.all

    render json: @days.as_json(include: [:combos, :events, :products])
  end

  def show
    render json: @day.as_json(include: [:combos, :events, :products])
  end

  def create
    @day = Day.new(day_params)

    if @day.save
      render json: @day, status: :created, location: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  def update
    if @day.update(day_params)
      render json: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @day.destroy
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(
      :day, :available, :available_hour, :unavailable_hour,
      :establishment_id,
      product_ids: []
    )
  end
end
