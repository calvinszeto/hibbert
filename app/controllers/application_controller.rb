class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :allow_from_screenfly

	def index
	end

	private
		def allow_from_screenfly
			response.headers["X-Frame-Options"] = "ALLOW FROM http://quirktools.com"
		end
end
