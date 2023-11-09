class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_up_params, if: :devise_controller?

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio role email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name photo bio email password current_password role])
  end
end
