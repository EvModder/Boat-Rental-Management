require 'simplecov'
SimpleCov.start

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
    fill_in "user_email", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    click_button "Log in"
end


# Given (/^the user is not logged in$/) do
#     visit '/users/'
# end

Given (/^User does not exist$/) do
    create_visitor
    delete_user
end

Given (/^User exists$/) do
    create_visitor
  end

Given (/^the user is not logged in$/) do
    visit 'devise/sessions#destroy'
end

Given (/^the user is logged in$/) do
    create_visitor
    log_in
    
  end
  
When (/^the user sign up valid user data$/) do
    create_visitor
    sign_up
end

When (/^the user sign in with valid credentials$/) do
    create_visitor
    log_in
end

When (/^I sign out$/) do
     Logout
  end

When (/^the user signs up with an invalid email$/) do
    create_visitor
    @visitor = @visitor.merge(:email => "invalidemail")
    sign_up
end
 
When (/^the user sign up without a password$/) do
    create_visitor
    @visitor = @visitor.merge(:password => "")
    sign_up
end

When (/^the user sign up without a password confirmation$/) do
    create_visitor
    @visitor = @visitor.merge(:password_confirmation => "")
    sign_up
end


  
When (/^the user sign up with a mismatched password confirmation$/) do
    create_visitor
    @visitor = @visitor.merge(:password_confirmation => "confirmation")
    sign_up
end

When (/^the user return to the site$/) do
    visit '/'
  end

Then (/^the user should see a successful sign in message$/) do
    expect(page).to have_content "Signed in successfully."
  end

Then (/^the user should see a successful sign up message$/) do
    expect(page).to have_content "Welcome! You have signed up successfully."
end

Then (/^the user should see an invalid email message$/) do
    expect(page).to have_content "Email is invalid"
end
  
  Then (/^the user should see a missing password message$/) do
    expect(page).to have_content "Password can't be blank"
  end
  
  Then (/^the user should see a missing password confirmation message$/) do
    expect(page).to have_content "Password confirmation doesn't match Password"
  end
  
  Then (/^I should see a signed out message$/) do
    expect(page).to have_content "Signed out successfully."
  end
  
  Then (/^the user should see a invalid password message$/) do
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  Then (/^the user should see an invalid login message$/) do
    expect(page).to have_content "Invalid email or password."
  end

  Then (/^the user should be signed out$/) do
    page.should_not have_content "Logout"
    expect(page).to have_content "Sign up"
    expect(page).to have_content "Login"
  end

  Then (/^the user should be signed in$/) do
    expect(page).to have_content "Logout"
    expect(page).should_not have_content "Sign up"
    expect(page).should_not have_content "Login"
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
