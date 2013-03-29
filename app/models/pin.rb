class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_file_name

	validates :user_id, presence: true
  validates :description, presence: true
  validates_attachment :image, presence: true,
  											content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
												size: { less_than: 5.megabytes }

  # length { less than:} find under rails validations
  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"}

end
