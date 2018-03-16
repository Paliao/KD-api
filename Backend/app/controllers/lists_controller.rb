class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @lists = List.all

    render json: @lists
  end

  def show
    render json: @list
  end

  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
  end

  private

  def valid_event_time
    event_id = @list.event_id
    event = Event.find(event_id)
    event_day = event.day
    available_hour = event_day.available_hour
    unavailable_hour = event_day.unavailable_hour
    valid?(@list, available_hour, unavailable_hour)
  end

  def valid?(list, available_hour, unavailable_hour)
    List.valid_opening?(list, available_hour)
    List.expired?(list, unavailable_hour)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(
      :name, :per_users, :discount, :fixed_value,
      :opening, :expiration,
      :establishment_id, :events_id
    )
  end
end
