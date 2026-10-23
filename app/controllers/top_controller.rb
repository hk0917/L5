class TopController < ApplicationController
  def main
    if session[:login_uid]
      redirect_to tweets_path
    else
      render :main
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      redirect_to tweets_path
    else
      render :main, status: :unprocessable_entity
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end