class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @establishments = Establishment.all

    render json: @establishments.as_json(include: [:advertises, :combos, :contacts, :days, :events, :products, :ratings])
  end

  def show
    render json: @establishment.as_json(include: [:advertises, :combos, :contacts, :days, :events, :products, :ratings])
  end

  def create
    @establishment = Establishment.new(establishment_params)
    @establishment.users << current_user

    if @establishment.save && Category.category_checker(@establishment, 'Establishment')
      render json: @establishment, status: :created, location: @establishment
    else
      render json: @establishment.errors, status: :unprocessable_entity
    end
  end

  def update
    @establishment.users << current_user unless @establishment.users.include?(current_user)

    if @establishment.update(establishment_params) && Category.category_checker(@establishment, 'Establishment')
      render json: @establishment
    else
      render json: @establishment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @establishment.destroy
  end

  private

  def set_establishment
    @establishment = Establishment.find(params[:id])
  end

  def establishment_params
    params.require(:establishment).permit(
      :name, :street, :number, :complement, :latitude, :longitude,
      :area, :capacity, :parking_lot,
      :category_id, user_ids: []
    )
  end
end
