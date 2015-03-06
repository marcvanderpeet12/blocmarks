class UsersController < ApplicationController
  def show
   
    @user_topics = current_user.topics
    
    # @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.favorites
    @count = current_user.favorites.count
  end
end
