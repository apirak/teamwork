class AuthorizedController < ApplicationController
  before_action :set_current_team
  before_action :authorize_member

  private

  def set_current_team
    @current_team = Team.find(params[:team_id])
  end

  def authorize_member
    unless @current_team.users.include? current_user
      return redirect_to root_path, alert: "You are not a member"
    end
  end
end
