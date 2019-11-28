Rails.application.routes.draw do
  root 'links#new'

  resources :links, only: %i[create new index]
  resources :statistics, only: :index

  get '/statistics/visits_from_countries/:link_id', to: 'statistics#show_countries', as: :statistics_visit_from_countries
  get '/statistics/visits_count/:link_id', to: 'statistics#show_count', as: :statistics_visit_count
  get '/:short_url', to: 'links#show', as: :link
end
