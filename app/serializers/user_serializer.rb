class UserSerializer < ActiveModel::Serializer
  attributes :user_name, :activity_instances_with_activity

  def activity_instances_with_activity
  	activity_instances_with_activity = self.object.activity_instances.map do |activity_instance|
  		{
  			description: activity_instance.activity.description,
  			rating: activity_instance.rating,
  			completed: activity_instance.completed,
  			activity_started_at: activity_instance.created_at
  		}
  	end
    (activity_instances_with_activity.sort_by { |activity_instance| activity_instance[:activity_started_at]}).reverse
  end
end
