Rails.application.routes.draw do
  resources :news_items

  root 'news_items#index'
end
