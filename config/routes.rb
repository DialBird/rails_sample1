Rails.application.routes.draw do
  root 'home#show'
  get '/dashboard' => 'dashboard#show'
end
