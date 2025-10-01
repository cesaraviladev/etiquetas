class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Permitir acesso público às rotas do Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Filtra o tenant atual para cada request
  before_action :set_current_tenant

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  private

  def set_current_tenant
    ActsAsTenant.current_tenant = current_user.tenant if user_signed_in?
  end
end
