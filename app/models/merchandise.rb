class Merchandise < ApplicationRecord
  belongs_to :user
  has_many :category_merchandises, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :start_at, presence: true
end
