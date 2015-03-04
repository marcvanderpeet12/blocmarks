class BookmarksController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
     @topic = Topic.find(params[:topic_id])
     @bookmark = @topic.bookmarks.build(bookmark_params)
     @topic.bookmarks << @bookmark
     if @bookmark
      redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
  end

  def show
  end

  def update
    @topic = Topic.find(params[:topic_id])
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    name = @topic.title

     if @bookmark.destroy
       flash[:notice] = "Bookmark: \"#{name}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
