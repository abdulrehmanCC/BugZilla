Rails.application.routes.draw do
  devise_for :users 
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root  'projects#index'


  resources :projects do
    resources :bugs
  end

  get '*path' => redirect('/')

end
