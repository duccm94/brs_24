class Activity < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy

  enum action_type: ["read", "favorite", "follow", "review", "comment"]

  def timeline
    case action_type
    when "read"
      I18n.t "timelineread"
    when "favorite"
      I18n.t "timelinefavorite"
    when "follow"
      I18n.t "timelinefollow"
    when "review"
      I18n.t "timelinereview"
    when "comment"
      I18n.t "timelinecomment"
    end
  end

  def target
    if read? || favorite?
      Book.find_by_id target_id
    elsif follow?
      User.find_by_id target_id
    elsif review?
      Review.find_by_id target_id
    elsif comment?
      Comment.find_by_id target_id
    end
  end
end
