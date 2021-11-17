class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:email, :username, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:sign_in,
      keys: [:login, :password, :password_confirmation])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update,
      keys: [:email, :username, :password_confirmation, :current_password])
  end

end