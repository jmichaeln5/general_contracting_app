class Clients::CommentsController < CommentsController
  before_action :set_commentable

  def index
    @client = Client.find(params[:client_id])
    @comments = Comment.all.where(user_id: current_user, commentable_id:@client)
  end

  private

  def set_commentable
    @commentable = Client.find(params[:client_id])
  end
end
