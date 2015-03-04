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

     # Check if user is nil, if so, create and save a new user

     #  create & save new user => if.@user.nil?

     # Check if the topic is nil, if so, create and save a new topic

      @topic = Topic.create(title: params[:title], user_id: @user.id) if @topic.nil?

     # Now that we're sure we have a valid user and topic, build and save a new bookmark

     # Hoe creer je een bookmark?
     @bookmark = Bookmark.new(topic_id: @topic, user_id: @user, url: "what should be here")

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end