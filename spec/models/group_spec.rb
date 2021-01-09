require 'rails_helper'

RSpec.describe Group, type: :model do
  before { FactoryBot.build(:group) }
  before { FactoryBot.create(:user) }

  describe 'validations' do
    it 'should be invalid' do
      expect(FactoryBot.build(:group, name: nil)).not_to be_valid
    end

    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:expenses) }
    it { should belong_to(:user) }
  end
end
