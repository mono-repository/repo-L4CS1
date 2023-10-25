require 'bcrypt'

class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  #課題2
  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == BCrypt::Password.new(params[:pass])
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      flash[:error] = 'ユーザーIDまたはパスワードが正しくありません。'
      redirect_to top_login_path
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
  
  def signup
    render "signup"
  end
end