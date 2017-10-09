Given(/^the user is on the homepage$/) do
    visit root_path
  end
  
Then(/^the user should see the sign up link$/) do
    expect(page).to have_content("Sign Up")
end

Then(/^the user should see the Login link$/) do
    expect(page).to have_content("Login")
end

When(/^the user click the Sign Up link$/) do
    click_link "Sign Up"
end


def create_visitor
    @visitor ||= {:email => "test@test.com",
      :password => "password", :password_confirmation => "password" }
end

def find_user
    @user ||= User.where(:email => @visitor[:email]).first
end

def create_user
    create_visitor
    delete_user
    @user = FactoryGirl.create(:user, @visitor)
end
  
def delete_user
    @user ||= User.where(:email => @visitor[:email]).first
    @user.destroy unless @user.nil?
end

def sign_up
    delete_user
    visit '/users/sign_up'
    fill_in "user_email", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
    click_button "Sign up"
    find_user
end

def log_in
    visit '/users/sign_in'
    fill_in "Email", :with => @visitor[:email]
    fill_in "Password", :with => @visitor[:password]
    click_button "Log in"
end

Given (/^I am not logged in$/) do
    visit '/users/sign_out'
end

When (/^the user sign up valid user data$/) do
    create_visitor
    sign_up
end

Then (/^I see a successful sign in message$/) do
    expect(page).to have_content "Signed in successfully."
  end

Then (/^the user should see a successful sign up message$/) do
    expect(page).to have_content "Welcome! You have signed up successfully."
end

Then (/^the user should see an invalid email message$/) do
    page.should have_content "Email is invalid"
end
  
  Then (/^the user should see a missing password message$/) do
    page.should have_content "Password can't be blank"
  end
  
  Then (/^the user should see a missing password confirmation message$/) do
    page.should have_content "Password doesn't match confirmation"
  end
  
  Then (/^I should see a mismatched password message$/) do
    page.should have_content "Password doesn't match confirmation"
  end
  
  Then (/^I should see a signed out message$/) do
    page.should have_content "Signed out successfully."
  end
  
  Then (/^the user should see a invalid password message$/) do
    page.should have_content "Invalid email or password."
  end

# When(/^the user click the Login link$/) do
#     click_link "Login"
#     create_user
#     fill_in "Email", :with => @user[:email]
#     fill_in "Password", :with => @user[:password]
#     click_on "Log in"
#     visit home_page_index_path
# end

# Then (/^the user should see welcome message$/) do
#     expect(page).to have_content("Signed in successfully.")
# end



# Then (/^the user should see logout link$/) do
#     expect(page).to have_content("Logout")
# end

#Invalid email or password.