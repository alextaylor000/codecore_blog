class FavouritesController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.find(params[:post_id])
    fave = Favourite.new
    fave.user = current_user
    fave.post = @post
    fave.save

    respond_to do |format|
      format.html { redirect_to @post }
      format.js   { render "fave"  }
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    fave = current_user.favourites.find_by_id(params[:id])

    if fave
      fave.destroy
    else
      flash[:alert] = "Error deleting fave!"
    end

    respond_to do |format|
      format.html { redirect_to @post }
      format.js   { render "fave" }
    end

  end
end
