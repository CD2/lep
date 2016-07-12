Rails.application.routes.draw do

  namespace :admin do
    root :to => redirect('/admin/employer_forms')
    resources :employer_forms, only: [:index, :show, :destroy]
  end

  resources :employer_forms
  root 'employer_forms#new'


end
