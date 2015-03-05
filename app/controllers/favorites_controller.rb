class FavoritesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.favorites.build(bookmark: @bookmark)
    
    if like.save
      flash[:notice] = "You have favorites this bookmark"

    else
      flash[:error] = "Something went wrong" 
    end
    redirect_to :back
  end

  def destroy
    @bookmark = Bookmark.find(params[:post_id])
    favorite = current_user.favorited(@bookmark)

    if favorite.destroy
      flash[:notice] = "You have unfavorited this post."
    else
      flash[:error] = "Something broke trying to unfavorite this post."
    end
    redirect_to :back
  end



end

