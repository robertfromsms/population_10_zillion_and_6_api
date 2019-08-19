class ActivityInstanceSerializer < ActiveModel::Serializer
  attributes :id, :rating, :completed, :activity_details
  
  def activity_details
  	{
  		description: self.object.activity.description,
  		accessibility: self.object.activity.accessibility,
      category: self.object.activity.category,
      participants: self.object.activity.participants,
      price: self.object.activity.price
  	}
  end
end