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
    @boat = Boat.find(session[:boat_id])
    original_available = @boat.available_date.split(',')
    new_available = []
    required_date = params[:rent][:date_required].split(',')
    for date in original_available do
      is_same = false
      for r_date in required_date do
        if date == r_date
          is_same = true
          break
        end
      end
      if is_same == false
        new_available.push(date)
      end
    end
    new_available_date = new_available.join(',')

    if @rent.save
      # If save succeeds, redirect to the index action
      @boat.update_attributes({ :available_date => new_available_date})
      flash[:notice] = "Your order has been placed."
      session[:boat_name] = Boat.find(@rent.boat_id).name
      session[:date] = @rent.date_required
      session[:captain] = @rent.captainRequired
      redirect_to(rents_confirm_path)
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
