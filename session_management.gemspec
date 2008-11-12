Gem::Specification.new do |s|
  s.name = "session_management"
  s.version = "1.0.0"
  s.date = "2008-11-12"
  s.summary = "Session Management Plugin in object oriented way."
  s.email = "andrzej.sliwa@i-tool.eu"
  s.homepage = "http://github.com/andrzejsliwa/session_management/tree/master"
  s.description = "Session Management Plugin in object oriented way."
  s.has_rdoc = false
  s.authors = ["Andrzej Sliwa"]
  s.files = [ 
              "MIT-LICENSE",
              "README",
              "generators/session_management",
              "generators/session_management/session_management_generator.rb",
              "generators/session_management/templates",
              "generators/session_management/USAGE",
              "init.rb",
              "install.rb",
              "lib/session_management",
              "lib/session_management/exceptions.rb",
              "lib/session_management/session.rb",
              "lib/session_management.rb",
              "rails/init.rb",
              "Rakefile",
              "session_management.gemspec",
              "test/functional",
              "test/functional/session_management_test.rb",
              "test/unit/user_session_test.rb",
              "uninstall.rb" ]
  s.add_dependency("rails", [">= 2.1.0"])
end