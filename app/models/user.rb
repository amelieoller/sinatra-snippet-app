class User < ActiveRecord::Base
	# access through bcrypt, creates `authenticate` method
	has_secure_password
	
	has_many :snippets
end