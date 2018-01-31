class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invite, only: [:show, :update, :destroy]

  def index_establishment
    @invites = Invite.possible_invites(possible_establishments)

    render json: @invites, include: [:establishments]
  end

  def show
    render json: @invite, include: [:establishments]
  end

  def create
    @invite = Invite.new(invite_params)

    if check_establishment_permission(params[:invite][:establishment_id])
      if myself? && @invite.save
        render json: @invite, status: :created, location: @invite
      else
        render json: @invite.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    case params[:invite][:invite_type]
    when 'STAFF'
      handle_staff
    when 'FRIEND'
      handle_friend
    else
      render json: { error: 'You have not informed the type of the invite' }, status: :bad_request
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

  def handle_staff
    if permission?
      params[:invite][:accepted] = nil unless check_sender
      if @invite.update(invite_params)
        staff_answer(current_user, @invite)
      else
        render json: @invite.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def permission?
    check_establishment_permission(params[:invite][:establishment_id]) || check_sender
  end

  def check_establishment_permission(checker)
    possible_establishments.include?(checker.to_i)
  end

  def possible_establishments
    owner_relations = Owner.is_owner?(current_user)
    establishment_ids = []
    owner_relations.each { |relation| establishment_ids << relation.establishment_id }
    establishment_ids
  end

  def check_sender
    invite_id = params[:id].to_i
    invite = Invite.find(invite_id)
    invite.user_id == current_user.id
  end

  def myself?
    if check_sender
      @invite.errors[:error] << 'You cannot send a invite to yourself'
      false
    else
      true
    end
  end

  def staff_answer(user, invite)
    accepted = invite.accepted
    establishment_id = invite.establishment_id
    establishment = Establishment.find(establishment_id)

    if accepted && Establishment.already_in?(establishment, user.id)
      establishment.users << user
      invite.destroy
      render json: { status: 'You accepted the invite and now is a part of this establishment' }
    else
      render json: { status: 'You did not accepted the invite to be a part of this establishment' }
    end
  end

  def set_invite
    if check_establishment_permission(params[:id]) || check_sender
      @invite = Invite.find(params[:id])
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def invite_params
    params.require(:invite).permit(
      :description, :accepted, :invite_type,
      :establishment_id, :user_id
    )
  end
end
