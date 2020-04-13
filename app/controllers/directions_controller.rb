class DirectionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @properties = current_user.properties.all.order("created_at DESC")
    @properties_reversed = @properties.reverse
  end

  def waypoints
    @properties = current_user.properties.all.order("created_at DESC")
    @properties_reversed = @properties.reverse
  end

  def test_page
    @properties = current_user.properties.all.order("created_at DESC")
    @properties_reversed = @properties.reverse
  end


end
