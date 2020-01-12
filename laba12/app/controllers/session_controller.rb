class SessionController < ApplicationController
  def new; end

  def sign_in
    user = User.auth(params[:email], params[:pass])
    if user.nil?
      redirect_to signin_path, notice: 'Неверный логин или пароль!'
    else
      session[:current_user_id] = user.id
      redirect_to root_path
    end
  end

  def sign_out
    session[:current_user_id] = nil
    redirect_to signin_path
  end
end
