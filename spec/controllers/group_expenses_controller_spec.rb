require 'rails_helper'

RSpec.describe GroupExpensesController, type: :controller do
  before { sign_in FactoryBot.create(:user) }
  before { @expense = FactoryBot.create(:expense) }
  before { @group = FactoryBot.create(:group) }
  before { @eg = FactoryBot.create(:group_expense) }

  describe 'Create #destroy' do
    context 'with valid params' do
      it 'redirects to the current group page' do
        delete :destroy, params: { id: @eg.id, expense_id: @expense.id, group_id: @group.id }
        expect(response).to redirect_to(@group)
      end
    end
  end
end
 