class Captain < ActiveRecord::Base

  # can't be saved without a user
  #belongs_to :user
  belongs_to :user
end