class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?


  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def logged_in?
    current_user != nil
  end


  private

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end

  helper_method :current_room
end


  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end
