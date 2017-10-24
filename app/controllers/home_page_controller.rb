class HomePageController < ApplicationController
  
  def index
    @boats = Boat.all
  end
end
