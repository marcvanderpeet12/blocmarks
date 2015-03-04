class FavoritesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.favorites.build(bookmark: @bookmark)
    
    if life.save
      flash[:notice] = "You have favorites this bookmark"
    else
      flash[:error] = "Something went wrong" 
    end

  end

  def destroy
    
  end



end

