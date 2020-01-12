# frozen_string_literal: true

Rails.application.routes.draw do
  root 'number#index'

  scope :number do
    get 'find' => 'number#armstrong', as: 'find'
    get 'records' => 'number#all_records', as: 'all_records'
    get 'last' => 'number#last_record', as: 'last_record'
  end
end
