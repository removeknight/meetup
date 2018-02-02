class User < ApplicationRecord
	# 自带验证密码
	has_secure_password
	has_many :comments
	has_many :issues

	before_create { generate_token(:auth_token)}
	validates :name, :email, presence: true
	validates :name, :email, uniqueness: {case_sensitive: false}

	mount_uploader :avatar, AvatarUploader
	


	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end
