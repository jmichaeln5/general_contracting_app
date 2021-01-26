class DirectionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @clients = current_user.clients.all.order("created_at DESC")

    @valid_clients = []
    @clients.map {|c| @valid_clients << c if c.address.present? }
  end

end
