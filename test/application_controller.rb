class ApplicationController < ActionController::Base

	def current_user
#		@current_user ||= (login_from_session || :false)
		@current_user ||= (login_from_session || nil)
	end

	def current_user=(new_user)
		@current_user = new_user || :false
	end

	def login_from_session
		self.current_user = User.find_or_create_by_id(session[:user_id]) if session[:user_id]
	end

	def redirections
		@redirections ||= HashWithIndifferentAccess.new({
			:not_be_user => {
				:message => "You can't be the user!",
				:redirect_to => "http://cnn.com"
			}
		})
	end

end
