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
    @clients = current_user.clients.all.order("created_at DESC")
  end

  private


end
