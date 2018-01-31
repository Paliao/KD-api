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
    establishment_id = @event.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@event, 'Event') && @event.save
        render json: @event, status: :created, location: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @event.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@event, 'Event') && @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @event.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @event.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :establishment_id, :day_id)
  end
end
