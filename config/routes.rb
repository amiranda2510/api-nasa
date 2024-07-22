Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/daily_images', to: 'daily_images#index'
  get '/asteroids', to: 'asteroids#index'
end
