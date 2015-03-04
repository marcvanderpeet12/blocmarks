class TopicsController < ApplicationController
  def index
    @topics = current_user.topics 
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    user = current_user
    user.topics << @topic
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end


  def update
    @topic = Topic.find(params[:id])
    
     if @topic.update_attributes(topic_params)
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    name = @topic.title

     if @topic.destroy
       flash[:notice] = "Topic: \"#{name}\" was deleted successfully."
       redirect_to topics_path
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end
    

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
