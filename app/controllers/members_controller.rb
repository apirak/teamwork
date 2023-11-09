class MembersController < ApplicationController
  before_action :set_current_team

  def index
    @members = @current_team.members
  end

  private

  def set_current_team
    @current_team = Team.find(params[:team_id])
  end
end
