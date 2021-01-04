class Clients::ProjectsController < ProjectsController
  before_action :set_projectable

  def index
    @client = Client.find(params[:client_id])
    @projects = Project.all.where(user_id: current_user, projectable_id:@client)
  end

  private

  def set_projectable
    @projectable = Client.find(params[:client_id])
  end
end
