class RegistrationsController < Devise::RegistrationsController
      private

        def sign_up_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip_code, :isCaptain)
          end

        def account_update_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address_line1, :address_line2, :city, :state, :zip_code, :isCaptain)
          end
  end