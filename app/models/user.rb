class User < ApplicationRecord
	has_secure_password

	validates :user_name, presence: true, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true

	has_many :activity_instances
 	has_many :activities, through: :activity_instances

 	has_many :comments

 	def completed_activity_instances_count
 		self.activity_instances.where(completed: true).length
 	end
end
