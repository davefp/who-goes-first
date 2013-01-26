class RulesController < ApplicationController
  before_filter :template_rule

  def index
    redirect_to :root
  end

  def random
    @rule = Rule.with_state(:approved).random
  end

  def show
    @rule = Rule.find(params[:id])
    render :status => 404 unless @rule && @rule.approved?
  end

  def create
    Rule.create(params[:rule])
    flash[:notice] = "Thanks! Your rule has been submitted for moderation."
    redirect_to :root
  end

  private

  def template_rule
    @new_rule = Rule.new
  end
end
