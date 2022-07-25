class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?


    rescue_from CanCan::AccessDenied do |exception|
        redirect_to projects_path, :alert => exception.message
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
    end
    private
    def record_not_found
        render "error.html.erb"
        # handle redirect
    end

end
