class Cocktail < ApplicationRecord
    has_many :ingredients, dependent: :destroy
  
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
    validates :container, presence: true
    validates :instructions, presence: true
    validates :image, presence: true
  end
  