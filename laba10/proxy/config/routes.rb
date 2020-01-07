Rails.application.routes.draw do
  root 'number#index'
  get 'number/find' => 'number#armstrong', as: 'find'
end
