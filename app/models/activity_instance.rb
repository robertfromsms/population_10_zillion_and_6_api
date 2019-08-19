class ActivityInstance < ApplicationRecord
	validates :user_id, presence: true
	validates :activity_id, presence: true

  	belongs_to :user
 	belongs_to :activity
end
