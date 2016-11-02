class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    if resource.admin?
      rails_admin_path
    else
      flash[:error] = "admin"
      errors_path
    end
  end
end
