class ClientsController < ApplicationController
  respond_to :html, :xml, :json

  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :client_og, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json

  def all_clients
    @clients = Client.all
  end

  def index
    @user = current_user
    @clients = current_user.clients.all.order("created_at DESC")

    # if params[:search_data]
    #   byebug
    #   @clients = current_user.clients.search(params[:search_data]).order("created_at DESC")
    # else
    #   @clients = current_user.clients.all.order('created_at DESC')
    # end

  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
  end

  # GET /clients/new
  def new
    @user = current_user
    @client = @user.clients.build
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @user = current_user
    # @client = Client.new(client_params)
    @client = @user.clients.build(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @user = current_user

    @client.destroy
    respond_to do |format|
      format.html { redirect_to user_clients_path(@user), notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def client_og
      @client_og_id = @client.user_id
      @client_og = User.find_by_id(@client_og_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      # params.require(:client).permit(:description, :latitude, :longitude, :address, :city, :state, :zip, :link, :user_id, :search_data)
      params.require(:client).permit(:description, :latitude, :longitude, :address, :city, :state, :zip, :link, :user_id)
    end
end
