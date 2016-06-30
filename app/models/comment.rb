class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true, length: {maximum: 150}
end
