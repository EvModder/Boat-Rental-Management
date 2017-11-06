class HomePageController < ApplicationController
  
  def rent
    @boats = Boat.all
  end
end
