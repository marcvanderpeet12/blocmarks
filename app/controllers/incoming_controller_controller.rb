class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    
     # Find the user by using params[:sender]
     @user = User.find_by_email(params[:sender])
     # Find the topic by using params[:subject]
     @topic = Topic.find_by(user_id: @user, title: params[:subject])

     # Assign the url to a variable after retreiving it from params["body-plain"]
     # What exactly are we doing here?
     @url = "http://#{params["body-plain"]}"

     # perform checks on user and topic.

    @user = User.create(email: params[:sender], password: params[:title]) if @user.nil?
    @topic = Topic.create(title: params[:title], user_id: @user.id) if @topic.nil?

     # Now that we're sure we have a valid user and topic, build and save a new bookmark

     @bookmark = Bookmark.build(url: @url, topic_id: @topic)
     @bookmark.save

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end