module NavigationHelpers
    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    def path_to(page_name)
      case page_name
  
      when /the home\s?page/
        '/'
  
      when /the sign up page/
        '/users/sign_up'
  
      when /the sign in page/
        '/users/sign_in'
      end 
  
    end
end
  