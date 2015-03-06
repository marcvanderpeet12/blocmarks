class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :favorites
  has_many :bookmarks
  has_many :bookmarks, through: :favorites


  
       def liked(bookmark)
        favorites.where(bookmark_id: bookmark.id).first
       end

end
