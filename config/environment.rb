# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
#config.action_mailer.default_url_options = { host: 'localhost:3000' }
#ActionMailer::Base.smtp_settings = {
#   :tls => true,
#   :address => "smtp.gmail.com",
#   :port => "587",
#   :domain => "gmail.com",
#   :authentication => :login,
#   :user_name => "leakenate",
#   :password => "[password]"
#}