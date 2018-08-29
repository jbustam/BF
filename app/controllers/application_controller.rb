class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: 'No tiene permiso para acceder a esta pagina'
  end
end
