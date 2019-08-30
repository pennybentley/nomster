Rails.application.routes.draw do
  root 'places#index'
  resources :places

  def new

  end
  
end
