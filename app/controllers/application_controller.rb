class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :name, :email, :password, :password_confirmation
    end
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :sex, :phone, :address, :birthday,  :current_password])
  end

  private
  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
