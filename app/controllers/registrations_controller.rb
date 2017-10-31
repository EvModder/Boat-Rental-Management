class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @captain = @user.build_captain

  def create
      @user = User.new(sign_up_params)
      respond_to do |format|
        if @user.save
          @captain = @user.build_captain(
              {
                  #user_id: @user.id,
                  age: params[:user][:captains][:age],
                  year_experience: params[:user][:captains][:year_experience],
                  comments: params[:user][:captains][:comments],
                  first_available_date: params[:user][:captains][:first_available_date],
                  monday: params[:user][:captains][:monday],
                  tuesday: params[:user][:captains][:tuesday],
                  wednesday: params[:user][:captains][:wednesday],
                  thursday: params[:user][:captains][:thursday],
                  friday: params[:user][:captains][:friday],
                  saturday: params[:user][:captains][:saturday],
                  sunday: params[:user][:captains][:sunday],

              }).save(validate: false)

          format.html { redirect_to root_path, notice: 'Captain was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
      private

        def sign_up_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip_code, :isCaptain, captains_attributes: [:id, :user_id, :age, :year_experience, :comments,
            :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
        end

        def account_update_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address_line1, :address_line2, :city, :state, :zip_code, :isCaptain, captains_attributes: [:id, :user_id, :age, :year_experience, :comments,
            :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
        end
end