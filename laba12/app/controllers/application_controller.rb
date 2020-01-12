# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate, except: %i[sign_in new create]

  private

  def current_user
    @current_user ||= session[:current_user_id] &&
                      User.find_by(id: session[:current_user_id])
  end

  def authenticate
    if current_user
      puts "Пользователь: #{current_user.email}"
    else
      puts 'Пользователь не аутентифицирован!'
      redirect_to signin_path
    end
  end
end
