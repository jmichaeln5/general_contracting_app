class CheckinsController < ApplicationController
  before_action :authenticate_user!

  def index
    @checkins = Checkin.all.where(user_id: current_user).order("created_at DESC")
    # byebug
  end

  def show
    @checkin = Checkin.find(params[:id])
  end

  def edit
    # @checkin = Checkin.find(params[:id])
  end

  def update
      # @checkin = @checkinable.checkins.find(params[:id])
      @checkin = Checkin.find(params[:id])
      if @checkin.update_attributes(checkin_params)
          redirect_to @checkinable, notice: "Check-In Updated Successfully."
      else
          render :edit, notice: "Checkin could not be updated."
      end
  end


  def create
    # byebug

    @checkin = @checkinable.checkins.new checkin_params
    @checkin.user_id = current_user.id
    # byebug
    @checkin.save

    redirect_to @checkinable, notice:"Check-In Created Successfully."
    # redirect_to @checkin, notice:"Checkin Created Successfully."
  end


  def destroy
    @checkin = Checkin.find(params[:id])

    # byebug

    @checkin.destroy

    if @checkin.destroy
      redirect_to @checkin.checkinable, notice: "Check-In Deleted Successfully."
      # redirect_to @checkinable, notice: "Checkin deleted."
    end
  end


  private

  def checkin_params
    params.require(:checkin).permit(:checkinable_type, :checkinable_id,  :user_id, :description, :time_contacted)
  end

end
