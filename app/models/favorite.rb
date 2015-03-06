class Favorite < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user

  validates :bookmark_id, presence: true
  validates :user_id, presence: true
end
