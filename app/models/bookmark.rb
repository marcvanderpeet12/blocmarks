class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :favorites
  belongs_to :user

  has_many :users, through: :favorites

end
