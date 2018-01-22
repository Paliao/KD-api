class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @events = Event.all

    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = Event.new(event_params)

    if @event.save && Category.category_checker(@event, 'Event')
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params) && Category.category_checker(@event, 'Event')
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :establishment_id, :day_id)
  end
end
