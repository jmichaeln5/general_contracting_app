class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def index
  end

  def dashboard
    @properties = current_user.properties.all.order("created_at DESC")
    # byebug
  end

  def test_page
    @properties = current_user.properties.all.order("created_at DESC")
    @properties_reversed = @properties.reverse
  end

  def about
  end

  private


end
