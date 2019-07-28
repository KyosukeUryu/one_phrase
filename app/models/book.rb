class Book < ApplicationRecord
  belongs_to :author
  has_many :phrases
  
  validates :name, presence: true, length: { maximum: 255 }
end
