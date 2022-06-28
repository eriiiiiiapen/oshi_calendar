class Merchandise < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :start_at, presence: true

end
