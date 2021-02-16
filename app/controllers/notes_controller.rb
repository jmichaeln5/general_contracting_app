class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :access_to_notable_types
  before_action :form_options
  before_action :notes_page, except:[:new, :edit]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all.where(user_id: current_user).order("created_at DESC")
    @clients = current_user.clients.all.order(:name)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @notes_show = true
  end

  # GET /notes/new
  def new
    @form_options = ['General', 'Client', 'Project']
    @note = Note.new
    # @clients = current_user.clients.all.order(:name)
    @clients = Client.all.where(user_id: current_user).order('name ASC')
    @projects = Project.all.where(user_id: current_user).order("created_at DESC")

    # @projects = []
    # @clients.map {|c| @projects << c.projects }
    # @projects.

  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create

    # byebug


    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :show }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def access_to_notable_types
      # @clients = current_user.clients.all.order(:name)
      @clients = Client.all.where(user_id: current_user).order("created_at DESC")
      @projects = Project.all.where(user_id: current_user).order("created_at DESC")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:notable_type, :notable_id, :user_id, :title, :body)
    end

    def form_options
      @form_options = ['General', 'Client', 'Project']
    end

    def notes_page
      @notes_page = true
    end

    # def set_notable
    #   case @note.notable_type
    #     when "Client"
    #       @notable = Client.find(params[:client_id])
    #     when "Client"
    #       @notable = Client.find(params[:client_id])
    #     else
    #       @notable = Client.find(params[:client_id])
    #     end
    # end

end
