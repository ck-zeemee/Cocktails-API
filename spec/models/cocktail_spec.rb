require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  describe 'associations' do
    it { should have_many(:ingredients).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:container) }
    it { should validate_presence_of(:instructions) }
    it { should validate_presence_of(:image) }
  end

  describe 'creating a cocktail' do
    let(:cocktail) { build(:cocktail) }

    it 'is valid with valid attributes' do
      expect(cocktail).to be_valid
    end

    it 'is invalid without a name' do
      cocktail.name = nil
      expect(cocktail).not_to be_valid
    end

    it 'is invalid without a category' do
      cocktail.category = nil
      expect(cocktail).not_to be_valid
    end

    it 'is invalid without instructions' do
      cocktail.instructions = nil
      expect(cocktail).not_to be_valid
    end
  end
end
