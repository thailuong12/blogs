class ApplicationController < ActionController::Base
    include Pundit

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if:  :devise_controller?
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordInvalid, with: -> (err) do
      flash[:alert] = err.record.errors.full_messages
      redirect_to root_url
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    private
  
    def user_not_authorized
      flash.alert = "You dont have permission on this resource"
      redirect_to root_path
    end
end
