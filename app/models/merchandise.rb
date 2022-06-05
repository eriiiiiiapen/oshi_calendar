class Merchandise < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :start_at, presence: true

end
