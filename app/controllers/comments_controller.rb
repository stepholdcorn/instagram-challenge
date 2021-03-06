class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.save ? (redirect_to posts_path) : (render 'new')
  end

  private
  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
