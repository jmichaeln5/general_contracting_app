class Projects::CommentsController < CommentsController
  before_action :set_commentable

  def index
    @project = Project.find(params[:project_id])
    @comments = Comment.all.where(user_id: current_user, commentable_id:@project)
  end

  private

  def set_commentable
    @commentable = Project.find(params[:project_id])
  end
end
