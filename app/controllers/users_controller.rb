class UsersController < ApplicationController

  def new
    #@subscription_plans = SubscriptionPlan.all
    @newspapers = Newspaper.includes(:subscription_plans).all
    render :new
  end

  def create

    @user = User.new(params[:user])
    #fail

    if @user.save
      redirect_to newspapers_url
    else
      # errors
      render :new
    end
  end

end
