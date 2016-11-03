class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end 

  def current_user
    session[:user_id]
  end

private
  def require_logged_in
    flash[:notice] = "you gotta log in to do that!"
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end     

end
