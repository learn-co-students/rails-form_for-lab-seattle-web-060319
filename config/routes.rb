Rails.application.routes.draw do
  resources :students, only: [:new, :show, :edit, :update, :create]
  resources :school_classes, only: [:new, :show, :edit, :update, :create]
end
