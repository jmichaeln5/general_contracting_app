class SearchController < ApplicationController

# https://www.youtube.com/watch?v=9tfZ0mFJlYc


  def index
  end

  def results

    # byebug


    # @clients = current_user.clients.all.order(:name)
    # @clients = Client.all.where(user_id: current_user)
    # @result_clients = Client.all.where(user_id: current_user).where('name LIKE ?', "%#{params[:q]}%")

    @form_options = [ 'Client', 'Project', 'Note']


    # @clients = Client.all.where(user_id: current_user)
    #
    # @result_clients = Client.all.where(user_id: current_user).where('name LIKE ?', "%#{params[:q]}%")


    # byebug

        if params[:clients].present?
          @searchable = Client.all.where(user_id: current_user)
          @results = Client.all.where(user_id: current_user).where('name LIKE ?', "%#{params[:clients]}%")

          @name = "Client"
        end

        if params[:projects].present?
          @searchable = Project.all.where(user_id: current_user)
          @results = Project.all.where(user_id: current_user).where('title LIKE ?', "%#{params[:projects]}%")

          @name = "Project"
        end

        if params[:notes].present?
          @searchable = Note.all.where(user_id: current_user)
          @results = Note.all.where(user_id: current_user).where('title LIKE ?', "%#{params[:notes]}%")

          @name = "Note"
        end

        # byebug





  end

end
