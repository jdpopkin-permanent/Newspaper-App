class SubscriptionPlansController < ApplicationController

  def new
    @subscription_plan = SubscriptionPlan.new
    @newspaper = Newspaper.find(params[:id])
    render :new
  end

  def create

  end

end
