Rails.application.routes.draw do

  resources :employer_forms
  root 'employer_forms#new'

end
