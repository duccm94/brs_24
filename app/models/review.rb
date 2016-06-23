class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  
  has_many :comments, dependent: :destroy

  validates :book_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}
  validates :rate, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
end
