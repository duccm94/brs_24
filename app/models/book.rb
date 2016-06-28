class Book < ActiveRecord::Base
  belongs_to :category

  mount_uploader :picture, PictureUploader

  has_many :reviews, dependent: :destroy

  validates :author, length: {maximum: 150}
  validates :category_id, presence: true
  validates :title, length: {maximum: 150}
  validates :rating, presence: true, format: {with: /\A\d+(?:.\d{0,2})?\z/},
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validate  :picture_size

  scope :category, -> category_id {where category_id: category_id}
  scope :title, -> title {where("title like ?", "%#{title}%")}
  scope :rating, -> rating {where("rating >= ?", "#{rating}")}
  scope :favorite, -> user_id {where("id in (select target_id from activities
    where (action_type = 1 and user_id = #{user_id}))")}
  scope :read, -> user_id {where("id in (select target_id from activities
    where (action_type = 0 and user_id = #{user_id}))")}

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t(:picturesize)
    end
  end
end
