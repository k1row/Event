class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private
  def logged_in?
  	!!session[:user_id]
  end

  def current_user
  	return unless session[:user_id]

    # Usage
  	# a ||= xxx
    #「||」演算子の自己代入演算子。a が 偽 か 未定義 なら a に xxx を代入する、という意味になります。

    # current_userが偽か未定義ならUserテーブルからの値を入れる
  	@current_user ||= User.find(session[:user_id])
  end

  def authenticate
  	return if logged_in?
  	redirect_to root_path, alert: 'ログインしてください'
  end
end
