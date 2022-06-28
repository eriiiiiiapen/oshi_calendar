class Category < ApplicationRecord
  belongs_to :user
  has_many :category_users, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
