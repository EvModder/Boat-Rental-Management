class BoatAttachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :boat
  acts_as_commontable
end
