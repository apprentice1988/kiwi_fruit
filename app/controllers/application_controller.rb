class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login?, :current_user

  private
  class AccessDenied < Exception; end

  def login_required
    unless login?
      redirect_to login_url(return_to: (request.fullpath if request.get?))
    end
  end

  def no_locked_required
    if login? and current_user.locked?
      raise AccessDenied
    end
  end

  def current_user
    @current_user ||= login_from_session || login_from_cookies unless defined?(@current_user)
    @current_user
  end

  def login?
    !!current_user
  end

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    forget_me
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def login_from_cookies
    if cookies[:remember_token].present?
      if user = User.find_by_remember_token(cookies[:remember_token])
        session[:user_id] = user.id
        user
      else
        forget_me
        nil
      end
    end
  end

  def forget_me
    cookies.delete(:remember_token)
  end

  def remember_me
    cookies[:remember_me] = {
      value: current_user.remember_token,
      expires: 2.weeks.from_now,
      httponly:true
    }
  end


end
