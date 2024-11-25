class Ingredient < ApplicationRecord
  belongs_to :cocktail

  validates :name, presence: true
  validates :measurement, presence: true
end
