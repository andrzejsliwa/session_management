class SessionManagementGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      
      m.class_collisions 'UserSession'
      m.directory 'config'
      m.template 'user_session.rb', 'config/user_session.rb'
                
      gsub_file 'app/controllers/application.rb', /(#{Regexp.escape("class ApplicationController < ActionController::Base")})/mi do |match|
        "#{match}\n  # See SessionManagment::ManagementsMethods for details\n  # This option enable object oriented session managment.\n  enable_session_management\n"
      end
      
    end
  end
  
  def gsub_file(relative_destination, regexp, *args, &block)
    path = destination_path(relative_destination)
    content = File.read(path).gsub(regexp, *args, &block)
    File.open(path, 'wb') { |file| file.write(content) }
  end
  
end
