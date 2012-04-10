class RulesController < ApplicationController
  def index
    redirect_to :root
  end

  def random
    @rule = Rule.with_state(:approved).random
    @new_rule = Rule.new()
    respond_to do |format|
      format.html { render }
      format.js   { render }
    end
  end

  def create
    Rule.create(params[:rule])
    flash[:notice] = "Thanks! Your rule has been submitted for moderation."
    redirect_to :root
  end
end
