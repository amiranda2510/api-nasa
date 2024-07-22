Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/daily_images', to: 'daily_images#index'
  get '/asteroids', to: 'asteroids#index'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
    controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :lists
  post 'lists/:id/add_img', to: 'lists#add_img'
  delete 'lists/:id/images/:image_id', to: 'lists#delete_img'
end
