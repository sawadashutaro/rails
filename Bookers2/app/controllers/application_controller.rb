class ApplicationController < ActionController::Base


	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		user_path(current_user.id)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	protected

	def configure_permitted_parameters

		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])

	end

	Refile.secret_key = '16c973e4247817b2fbf73d905f3c20618476cea613362140e01582c63dc0446856a076cdb1a43270f15c4d5f4a69ab978e21ec9cf26dd3661a7281b4f8397e95'
	
end
