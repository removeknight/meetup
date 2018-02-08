class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def current_user
  	@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end


  # The method helper_method is to explicitly share some methods defined in the controller 
  # to make them available for the view.
  helper_method :current_user
end
