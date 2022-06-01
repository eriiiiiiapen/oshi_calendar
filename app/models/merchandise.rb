class Merchandise < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :start_at, presence: true

end
