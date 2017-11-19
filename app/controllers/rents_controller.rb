class RentsController < ApplicationController
  def index
    @rents = Rent.where(boat_id: params[:boat_id])
  end

  def new
    @rent = Rent.new
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def create
    # Instantiate a new object using form parameters
    @rent = Rent.new(rent_params)
    @rent.boat_id = session[:boat_id]
    @rent.user_id = current_user.id
    @rent.user_name = current_user.first_name + ' ' + current_user.last_name
    # Save the object
    if @rent.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Your order has been placed."
      redirect_to(home_page_index_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def new_release
    respond_to do |format|
      format.html
      format.js
    end
  end

private

def rent_params
    params.require(:rent).permit(:user_id, :comments, :date_required, :captainRequired)
end

end
