module SessionManagement
  
  def self.included(base)
    base.extend ManagementsMethods
  end
    
  # This module is for extending ActionController::Base
  module ManagementsMethods
    
    # This method is for enabling session management
    # functionality for application
    def enable_session_management
      unless included_modules.include? InstanceMethods
        include InstanceMethods
      end
    end
  end
    
  # This module is used for include instance methods
  # for ActionController::Base
  module InstanceMethods
    
    private 
      def user_session
        @user_session ||= UserSession.new(session) 
      end
  end
  
end