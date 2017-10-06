class Boat < ActiveRecord::Base
  mount_uploader :image, ImageUploader

end
