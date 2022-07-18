class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :category_merchandises, dependent: :destroy
end
