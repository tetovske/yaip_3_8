# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  root 'number#index'

  scope :number do
    get 'find' => 'number#armstrong', as: 'find'
    get 'records' => 'number#all_records', as: 'all_records'
    get 'last' => 'number#last_record', as: 'last_record'
  end

  get 'signin' => 'session#new', :as => 'signin'
  get 'auth' => 'session#sign_in', :as => 'auth'
  get 'signout' => 'session#sign_out', :as => 'signout'
end
