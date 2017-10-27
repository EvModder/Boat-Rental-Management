class Boat < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :boat_attachments
  accepts_nested_attributes_for :boat_attachments
  #multiple images : https://stackoverflow.com/questions/21411988/rails-4-multiple-image-or-file-upload-using-carrierwave
  acts_as_commontable
end
