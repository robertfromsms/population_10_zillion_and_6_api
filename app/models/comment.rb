class Comment < ApplicationRecord
	validates :user_id, presence: true
	validates :activity_id, presence: true
	validates :content, presence: true
	
	belongs_to :user
	belongs_to :activity
end
