Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' } do
		get ':user/edit-profile' => 'devise/registration#edit', as: :edit_user_profile
	end	
  
	resources :expenses
	resources :groups
	resources :group_expenses, only: [:create, :destroy]

	get 'extExpenses', to: 'expenses#external_expense'
	root to: 'users#index'
end
