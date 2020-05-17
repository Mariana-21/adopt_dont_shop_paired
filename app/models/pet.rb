class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :image, :approximate_age, :sex, :shelter_id , :description, :adoptable
  has_many :application_pets
  has_many :applications, through: :application_pets
end
