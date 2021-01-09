require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  before { sign_in FactoryBot.create(:user) }
  before { @expense = FactoryBot.create(:expense) }

  describe 'GET #index' do
    it 'Renders index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #external_expenses' do
    it 'Renders external_expenses page' do
      get :external_expense
      expect(response).to be_successful
      expect(response).to render_template(:external_expense)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'Renders expense show page' do
      get :show, params: { id: @expense.id }
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'Renders expense new page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'Renders expense edit page' do
      get :edit, params: { id: @expense.id }
      expect(response).to be_successful
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Create #create' do
    context 'with invalid params' do
      it 'does not save the expense and renders new template' do
        post :create, params: { expense: { name: '' } }
        expect(response).to render_template('new')
      end
    end

    context 'with valid params' do
      it 'redirects to the expenses page' do
        post :create, params: { expense: { name: @expense.name,
                                           amount: @expense.amount } }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'Update #update' do
    context 'with invalid params' do
      it 'does not save the expense and renders edit template' do
        patch :update, params: { id: @expense.id, expense: { name: '' } }
        expect(response).to render_template('edit')
      end
    end

    context 'with valid params' do
      it 'redirects to the expense show page' do
        patch :update, params: { id: @expense.id, expense: { name: @expense.name,
                                                             amount: @expense.amount } }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'Destroy #destroy' do
    context 'with valid params' do
      it 'redirects to the expenses page' do
        delete :destroy, params: { id: @expense.id, group: { name: @expense.name,
                                                             amount: @expense.amount,
                                                             createdAt: @expense.createdAt } }
        expect(response).to redirect_to(expenses_path)
      end
    end
  end
end
 