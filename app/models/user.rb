class User < ApplicationRecord
	has_secure_password

	validates :user_name, presence: true, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true

	has_many :activity_instances
 	has_many :activities, through: :activity_instances

 	has_many :comments
end
