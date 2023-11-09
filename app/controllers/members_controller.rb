class MembersController < ApplicationController
  before_action :set_current_team

  def index
    @members = @current_team.members
  end

  def invite
    email = params[:email]
    if email.blank?
      return(
        redirect_to team_members_path(@current_team), alert: "No email provided"
      )
    end

    user =
      User.find_by(email: email) || User.invite!({ email: email }, current_user)
    unless user.valid?
      return(
        redirect_to team_members_path(@current_team), alert: "Email invalid"
      )
    end

    user.members.find_or_create_by(
      team: @current_team,
      roles: {
        admin: false,
        editor: true,
      },
    )

    redirect_to team_members_path(@current_team), notice: "#{email} invited!"
  end

  private

  def set_current_team
    @current_team = Team.find(params[:team_id])
  end
end
