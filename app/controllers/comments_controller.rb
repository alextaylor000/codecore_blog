class CommentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    comment_params = params.require(:comment).permit(:body)
    @post = post_by_id
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        Notifications.notify_owner_of_comment(@comment).deliver_later
        format.html { redirect_to post_path(@post) }
        format.js   { render }
      else
        format.html { render "posts/show" }
        format.js   { render :create_failure }
      end
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
