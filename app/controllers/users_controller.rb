# Skeleton for this code taken from a SO post.

class UsersController < ApplicationController

  def my_boats
    @boats = Boat.where(ownerid: current_user.id)
  end

  def my_rents
    @rents = Rent.where(user_id: current_user.id)
  end



  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @captain = @user.captain.create!(params[:captains])
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  private

  def user_params
    params.require(:user,:email,:pass_hash).permit(:setting1,:setting2,:etc)
  end

end