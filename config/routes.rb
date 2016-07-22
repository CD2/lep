Rails.application.routes.draw do

 
  devise_for :users
  namespace :admin do
    root :to => redirect('/admin/employer_forms')
    resources :employer_forms, only: [:index, :show, :destroy]
  end

  get 'employer_forms', to: 'employer_forms#new', as: :new_employer_form
  post 'employer_forms', to: 'employer_forms#create', as: :employer_forms
  get 'submitted', to: 'employer_forms#submitted', as: :submitted
  root 'employer_forms#new'


end
