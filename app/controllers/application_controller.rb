class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.is_a?(Admin)
          admin_dashboard_path
        else
          root_path
        end
    end

    rescue_from CanCan::AccessDenied do |exception|
      if current_user.nil?
        session[:next] = request.fullpath
        redirect_to new_user_session_url, alert: 'You have to log in to continue.'
      else
        respond_to do |format|
          format.json { render nothing: true, status: :not_found }
          format.html { redirect_to root_url, alert: exception.message }
          format.js   { render nothing: true, status: :not_found }
        end
      end
    end
end
