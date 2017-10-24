class CaptainsController < ApplicationController
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
        params.require(:captain).permit(:age, :year_experience, :comments,
                                             :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      end

  end



