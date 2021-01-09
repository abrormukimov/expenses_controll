require 'rails_helper'

feature 'create a expense' do
  before(:each) do
    sign_in FactoryBot.create(:user)
    @group = FactoryBot.create(:group)
    visit expenses_path
  end

  scenario 'is on the expenses page' do
    visit expenses_path
    expect(page).to have_content 'My Expenses'
  end

  feature 'create a new expense' do
    before(:each) do
      click_on 'Add New Expense'
      fill_in 'Name', with: 'Test Expense'
      fill_in 'Amount', with: '10'
      fill_in 'Createdat', with: '2020-10-10'

      click_on 'Save Expense'
    end

    scenario 'renders expense section on the post' do
      expect(page).to have_content 'Expense was successfully added.'
    end
  end

  feature 'create a new expense with invalid params' do
    before(:each) do
      click_on 'Add New Expense'
      fill_in 'Name', with: ''
      click_on 'Save Expense'
    end

    scenario "renders name can't be black error" do
      expect(page).to have_content 'Add your Expense'
    end
  end
end
