ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => AppConfig['SENDGRID_USERNAME'],
  :password       => AppConfig['SENDGRID_PASSWORD'],
  :domain         => AppConfig['DOMAIN'],
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp