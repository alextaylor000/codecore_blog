class CommentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    comment_params = params.require(:comment).permit(:body)
    @post = post_by_id
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      Notifications.notify_owner_of_comment(@comment).deliver_later
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post_path(post)
  end

  private
  def post_by_id
    Post.find(params[:post_id])
  end
end
