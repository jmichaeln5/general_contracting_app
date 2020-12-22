class DirectionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @clients = current_user.clients.all.order("created_at DESC")
  end

end
