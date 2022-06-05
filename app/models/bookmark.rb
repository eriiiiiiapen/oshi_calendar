class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :merchandise

  validates :user_id, uniqueness: {scope: :merchandise_id} 
end
