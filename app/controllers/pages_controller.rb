class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def index
  end

  def dashboard
    @on_dash = true

    @clients = current_user.clients.all.order("created_at DESC")
    @valid_clients = []
    @clients.map {|c| @valid_clients << c if c.address.present? }
    @projects = Project.all.where(user_id: current_user).order("created_at DESC")

  end

  def about
  end

  def test_page
    if current_user.present? && current_user.email == "sampleaccount@gmail.com"
      @clients = current_user.clients.all.order(:name)
      @projects = Project.all.where(user_id: current_user).order("created_at DESC")
    else
      redirect_to dashboard_path  
    end
  end

  private


end
