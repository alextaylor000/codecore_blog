class FavouritesController < ApplicationController
  before_action :authenticate_user

  def create
    post = Post.find(params[:post_id])
    fave = Favourite.new
    fave.user = current_user
    fave.post = post

    if !fave.save
      flash[:alert] = "Something went wrong favouriting this post"
    end

    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])
    fave = current_user.favourites.find_by_id(params[:id])
    if fave
      fave.destroy
    else
      flash[:alert] = "Error deleting fave!"
    end

    redirect_to post
  end
end
