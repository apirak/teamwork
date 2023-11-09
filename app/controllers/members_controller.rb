class MembersController < ApplicationController
  before_action :set_current_team

  def index
    @members = @current_team.members
  end

  def invite
    email = params[:email]
    user = User.find_by(email:email) || User.invite!({email:email}, current_user)
    user.members.find_or_create_by(team: @current_team, roles: {admin: false, editor: true})
  end

  private

  def set_current_team
    @current_team = Team.find(params[:team_id])
  end
end
