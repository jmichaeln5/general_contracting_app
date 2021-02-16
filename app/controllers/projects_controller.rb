class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :projects_page, except:[:new, :edit]


  def all_projects
    @projects = Project.all.where(user_id: current_user).order("created_at DESC")
    @clients = Client.all.where(user_id: current_user).order("created_at DESC")
  end

  def index
    @projects = Project.all.where(user_id: current_user).order("created_at DESC")
    # byebug
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
      # @project = @projectable.projects.find(params[:id])
      @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
          redirect_to @project, notice: "Project was updated."
      else
          render :edit, notice: "Project could not be updated."
      end
  end






  def create
    # @project = @projectable.projects.new project_params
    # @project.user_id = current_user.id
    # @project.save
    # redirect_to @project, notice:"Project Created Successfully."

    @project = @projectable.projects.new project_params
    @project.user_id = current_user.id
    # @project.save



      if @project.save
        redirect_to @project, notice:"Project Created Successfully."
      else
        redirect_to @project.projectable, alert:"Sorry, unable to create project. Please select a Project Type."
      end


  end








  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    if @project.destroy
      redirect_to all_projects_path, notice: "Project deleted."
    end
  end


  private

  def projects_page
    @projects_page = true
  end

  def project_params
    params.require(:project).permit(:projectable_type, :projectable_id,  :user_id, :title, :description, :category, :status, :payment_method, :latitude, :longitude, :address, :city, :state, :zip, :estimated_cost, :cost)
  end

end
