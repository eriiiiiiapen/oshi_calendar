class CategoryMerchandise < ApplicationRecord
  belongs_to :category
  belongs_to :merchandise
end
