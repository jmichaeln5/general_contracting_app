class PropertiesController < ApplicationController
  respond_to :html, :xml, :json

  before_action :authenticate_user!
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :property_og, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json

  def all_properties
    @properties = Property.all
  end

  def index
    @user = current_user
    @properties = @user.properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/new
  def new
    @user = current_user
    @property = @user.properties.build
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.json
  def create
    @user = current_user
    # @property = Property.new(property_params)
    @property = @user.properties.build(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @user = current_user

    @property.destroy
    respond_to do |format|
      format.html { redirect_to user_properties_path(@user), notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    def property_og
      @property_og_id = @property.user_id
      @property_og = User.find_by_id(@property_og_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:description, :latitude, :longitude, :address, :city, :state, :zip, :link, :user_id)
    end
end
