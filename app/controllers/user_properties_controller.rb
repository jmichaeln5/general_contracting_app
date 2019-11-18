class UserPropertiesController < ApplicationController
  before_action :set_user_property, only: [:show, :edit, :update, :destroy]

  # GET /user_properties
  # GET /user_properties.json
  def index
    @user_properties = UserProperty.all
    @properties = Property.all
  end

  # GET /user_properties/1
  # GET /user_properties/1.json
  def show
  end

  # GET /user_properties/new
  def new
    @user = current_user
    @user_property = UserProperty.new(user_id: params[:user_id])
  end

  # GET /user_properties/1/edit
  def edit
  end

  # POST /user_properties
  # POST /user_properties.json
  def create
    @user_property = UserProperty.new(user_property_params)

    respond_to do |format|
      if @user_property.save
        format.html { redirect_to @user_property, notice: 'User property was successfully created.' }
        format.json { render :show, status: :created, location: @user_property }
      else
        format.html { render :new }
        format.json { render json: @user_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_property.update(user_property_params)
        format.html { redirect_to @user_property, notice: 'User property was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_property }
      else
        format.html { render :edit }
        format.json { render json: @user_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_property.destroy
    respond_to do |format|
      format.html { redirect_to user_properties_url, notice: 'User property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_property
      @user_property = UserProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_property_params
      params.require(:user_property).permit(:user_id, :property_id)
    end
end
