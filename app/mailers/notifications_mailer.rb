class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@theflyingdeveloper.com"
  default :to => "david@theflyingdeveloper.com"

  def new_message(message)
    @message = message
    mail(:subject => "Who Goes First Feedback")
  end

end