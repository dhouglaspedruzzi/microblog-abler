class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  before_action :authorized

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to explore_index_path unless logged_in?
  end

  def redirect path, options={}
    flash[:notice] = options[:notice] if options[:notice]
    flash[:alert] = options[:alert] if options[:alert]
    render js: render_to_string(partial: 'layouts/redirect.js.erb', locals: { path: path })
  end

  def notify notifications, options={}
    type = options[:type] || :error
    render js: render_to_string(partial: 'layouts/notify', locals: { notifications: notifications, type: type })
  end

  def redirect_not_found
    redirect_to explore_index_path
  end

end
