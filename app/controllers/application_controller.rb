class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def api
  	return Newrelic.load_with_name("rejuvenation")
  end
end
