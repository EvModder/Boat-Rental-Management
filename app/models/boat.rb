class Boat < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  has_many :boat_attachments
  accepts_nested_attributes_for :boat_attachments
  #multiple images : https://stackoverflow.com/questions/21411988/rails-4-multiple-image-or-file-upload-using-carrierwave
  acts_as_commontable

  scope :state, -> (state) { where state: state }
  scope :city, -> (city) { where city: city }
  scope :capacity, -> (capacity) { where ("capacity > #{capacity} OR capacity = #{capacity}") }
end
