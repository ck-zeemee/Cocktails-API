require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'associations' do
    it { should belong_to(:cocktail) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:measurement) }
  end

  describe 'creating an ingredient' do
    let(:ingredient) { build(:ingredient) }

    it 'is valid with valid attributes' do
      expect(ingredient).to be_valid
    end

    it 'is invalid without a name' do
      ingredient.name = nil
      expect(ingredient).not_to be_valid
    end

    it 'is invalid without a measurement' do
      ingredient.measurement = nil
      expect(ingredient).not_to be_valid
    end
  end
end
