class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :merchandise, foreign_key: "merchandise_id"
  validates :amount, presence: true, numericality: { only_integer: true }

  validates :user_id, uniqueness: {scope: :merchandise_id}

end
