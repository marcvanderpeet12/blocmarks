class Favorite < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
end
