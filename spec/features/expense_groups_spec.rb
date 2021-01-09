require 'rails_helper'

feature 'create a expense with a group' do
  before(:each) do
    sign_in FactoryBot.create(:user)
    @group = FactoryBot.create(:group)
    @expense = FactoryBot.create(:expense)
    visit root_path
  end

  scenario 'is on the root page' do
    expect(page).to have_content 'Groups'
  end

  feature 'add expense to group' do
    before(:each) do
      visit groups_path(@group)
    end

    scenario 'renders ungrouped expenses on the page' do
      expect(page).to have_content 'My Groups'
    end
  end
end
