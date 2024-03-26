class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        # Customize the path according to your requirements
        new_report_path
      end
end
