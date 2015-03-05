require 'rails_helper'

describe FavoritesController do

  # include TestFactories
  include Devise::TestHelpers

  before do
    @bookmark = associated_bookmark
    @user = authenticated_user
    sign_in @user
  end

  describe '#create' do
    it "creates a favorite for the current user and specified bookmark" do
    expect( @user.favorites.find_by_bookmark_id(@bookmark.id) ).to be_nil

    post :create, { bookmark_id: @bookmark.id }

    expect( @user.favorites.find_by_bookmark_id(@bookmark.id) ).not_to be_nil
      end
  end

end


  def associated_bookmark(options={})
     bookmark_options = { 
       url: 'an url', 
       topic: Topic.create(title: 'Topic name'), 
     }.merge(options)

     Bookmark.create(bookmark_options)
  end

    
    def authenticated_user(options={})
     user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
     user = User.new(user_options)
     user.skip_confirmation!
     user.save
     user
    end

