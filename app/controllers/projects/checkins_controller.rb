class Projects::CheckinsController < CheckinsController
  before_action :set_checkinable

  def index
    @project = Project.find(params[:project_id])
    @checkins = Checkin.all.where(user_id: current_user, checkinable_id:@project)
  end

  private

  def set_checkinable
    @checkinable = Project.find(params[:project_id])
  end
end
