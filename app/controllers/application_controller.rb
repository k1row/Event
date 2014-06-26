class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  def error404
    render 'error404', status: 404, formats: [:html]
  end

  def error500(e)
    # エラーの種類とバックトレースの出力
    logger.error [e, *e.backtrace].join("\n")
    render 'error500', status: 500, formats: [:html]
  end

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
