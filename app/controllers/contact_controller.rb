class ContactController < ApplicationController

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      flash[:notice] = "Thanks for the feedback!"
      redirect_to :root
    else
      flash[:error] = "Please fill in all fields"
      redirect_to :root
    end
  end

end