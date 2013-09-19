class SubscriptionPlansController < ApplicationController

  def new
    @subscription_plan = SubscriptionPlan.new
    @newspaper = Newspaper.find(params[:newspaper_id])
    render :new
  end

  def create
    @subscription_plan = SubscriptionPlan.new(params[:subscription_plan])
    @newspaper = Newspaper.find(params[:newspaper_id])

    if @subscription_plan.save
      redirect_to newspaper_url(@newspaper)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @subscription_plan.errors.full_messages
      render :new
    end
  end

end
