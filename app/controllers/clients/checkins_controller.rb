class Clients::CheckinsController < CheckinsController
  before_action :set_checkinable

  def index
    @client = Client.find(params[:client_id])
    @checkins = Checkin.all.where(user_id: current_user, checkinable_id:@client)
  end

  private

  def set_checkinable
    @checkinable = Client.find(params[:client_id])
  end
end
