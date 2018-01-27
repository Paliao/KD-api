class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index_establishment
    @invites = Invite.possible_invites(possible_establishments)

    render json: @invites, include: [:establishments]
  end

  def show
    render json: @invite
  end

  def create
    @invite = Invite.new(invite_params)

    if possible_establishments.include?(params[:invite][:establishment_id])
      if @invite.save
        render json: @invite, status: :created, location: @invite
      else
        render json: @invite.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    if @invite.update(invite_params)
      render json: @invite
    else
      render json: @invite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invite.destroy
  end

  private

  def possible_establishments
    owner_relations = Owner.is_owner?(current_user)
    establishment_ids = []
    owner_relations.each { |relation| establishment_ids << relation.establishment_id }

    establishment_ids
  end

  def set_invite
    if possible_establishments.include?(params[:id])
      @invite = Invite.find(params[:id])
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def invite_params
    params.require(:invite).permit(
      :description, :accepted,
      :establishment_id, :user_id
    )
  end
end
