class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :merchandises, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_merchandises, through: :bookmarks, source: :merchandise

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def bookmark(merchandise)
    bookmark_merchandises << merchandise
  end

  def unbookmark(merchandise)
    bookmark_merchandises.destroy(merchandise)      
  end

  def bookmark?(merchandise)
    bookmark_merchandises.include?(merchandise)
  end  
end
