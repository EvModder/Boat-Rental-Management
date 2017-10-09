# Skeleton for this code taken from a SO post.

class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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