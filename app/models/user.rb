class User < ActiveRecord::Base

	attr_accessor :password
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create

	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
		if password.present?
			self.encrypted_password = BCrypt::Password.create(password)
		end
	end

	def clear_password
		self.password = nil
	end

	def self.authenticate(username="", login_password="")
		user = User.find_by_username(username)

		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end   

	def match_password(login_password="")
	    BCrypt::Password.new(encrypted_password) == login_password
	end
	
end
