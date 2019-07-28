class Phrase < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :content, presence: true
  validates :comment, presence: true
end
