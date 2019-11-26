Rails.application.routes.draw do
  root 'links#new'
  
  resources :links, only: %i[create new]

  get '/:friendly_id', to: 'links#show'
end
