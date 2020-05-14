class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content, :picture
  validates :rating, numericality: {greater_than: 0}
  validates :rating, numericality: {less_than: 6}
end
