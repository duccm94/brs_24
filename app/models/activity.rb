class Activity < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy

  enum action_type: ["read", "favorite", "follow", "followed", "review", "comment"]
end
