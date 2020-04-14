class DirectionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @properties = current_user.properties.all.order("created_at DESC")
  end

end
