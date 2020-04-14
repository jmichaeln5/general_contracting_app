class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def index
  end

  def dashboard
    @properties = current_user.properties.all.order("created_at DESC")
  end

  def about
  end

  def test_page
    @properties = current_user.properties.all.order("created_at DESC")
  end


  private


end
