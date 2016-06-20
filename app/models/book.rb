class Book < ActiveRecord::Base
  belongs_to :category

  mount_uploader :picture, PictureUploader
  
  has_many :reviews, dependent: :destroy

  validates :author, length: {maximum: 150}
  validates :category_id, presence: true
  validates :title, length: {maximum: 150}
  validates :rating, format: {with: /\A\d+(?:.\d{0,2})?\z/},
    numericality: {greater_than: 0, less_than: 10}
  validate  :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t(:picturesize)
    end
  end
end
