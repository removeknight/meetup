class UserMailer < ApplicationMailer
	default from: "hello@wetogether.com"
	
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome')
	end
end
