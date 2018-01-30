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

    if check_establishment_permission(params[:invite][:establishment_id])
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
    if permission? 
      if @invite.update(invite_params)
        render json: @invite
      else
        render json: @invite.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    if check_establishment_permission(params[:id])
      @invite.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def possible_establishments
    owner_relations = Owner.is_owner?(current_user)
    establishment_ids = []
    owner_relations.each { |relation| establishment_ids << relation.establishment_id }

    establishment_ids
  end

  def check_establishment_permission(checker)
    possible_establishments.include?(checker.to_i)
  end

  def check_sender
    params[:invite][:user_id] == current_user.id
  end

  # def alerady_in(establishment_id, user_id)
  #   establishment = Establishment.find(establishment_id)
  #   establishment.user_ids.exclude?(user_id)
  # end

  def permission?
    check_establishment_permission(params[:invite][:establishment_id]) || check_sender
  end

  def set_invite
    if check_establishment_permission(params[:id])
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
