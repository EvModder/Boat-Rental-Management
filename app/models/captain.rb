class Captain < ActiveRecord::Base

  # can't be saved without a user
  #belongs_to :user, { :optional  => false }
  belongs_to :usergit 
end