class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :book_id, presence: true
  validates :user_id, presence: true

  scope :user, -> user_id {where user_id: user_id}
  scope :book, -> book_id {where book_id: book_id}
end
