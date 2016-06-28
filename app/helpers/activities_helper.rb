module ActivitiesHelper
  def add_activity user, action_type, target_id
    @activity = Activity.create user_id: user.id, action_type: action_type,
      target_id: target_id
  end

  def remove_activity user, action_type, target_id
    @activity = user.activities.find_by action_type: action_type,
      target_id: target_id
    @activity.destroy
  end
end
