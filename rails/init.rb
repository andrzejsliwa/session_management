require 'session_management'

ActionController::Base.send( :include, SessionManagement )

RAILS_DEFAULT_LOGGER.info "** session_management: initialized properly."