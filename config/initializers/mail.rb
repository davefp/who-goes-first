ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => AppConfig[:sendgrid_username] || ENV['SENDGRID_USERNAME'],
  :password       => AppConfig[:sendgrid_password] || ENV['SENDGRID_PASSWORD'],
  :domain         => AppConfig[:domain] || ENV['DOMAIN'],
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp