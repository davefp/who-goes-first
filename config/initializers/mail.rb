ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => AppConfig[:sendgrid_username],
  :password       => AppConfig[:sendgrid_password],
  :domain         => AppConfig[:domain],
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp