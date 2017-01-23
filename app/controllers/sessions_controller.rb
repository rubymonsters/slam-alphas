class SessionsController < Clearance::SessionsController
	def create
		user = User.find_by(email: params[:session][:email])
		redirect_to sign_in_url, alert: "Du bist kein Admin-Nutzer" and return unless user.admin?
		super
	end
end