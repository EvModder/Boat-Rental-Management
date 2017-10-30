class CaptainsController < ApplicationController
  before_action :set_captain, only: [:show, :edit, :update, :destroy]

    def new
        @captain = Captain.new
    end

    def create
        # Instantiate a new object using form parameters
        @captain = Captain.new(captain_params)
        # Save the object
        if @captain.save
          # If save succeeds, redirect to the index action
          flash[:notice] = "Captain created successfully."
          redirect_to(home_page_index_path)
        else
          # If save fails, redisplay the form so user can fix problems
          render('new')
        end
    end

    private

    def captain_params
        params.require(:captain).permit(:user_id, :age, :year_experience, :comments,
                                             :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end

    def set_captain
      @captain = Captain.find(params[:id])
    end

end



