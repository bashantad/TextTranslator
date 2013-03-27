class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'request_layout'
end
