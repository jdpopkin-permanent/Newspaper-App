class NewspapersController < ApplicationController

  def new
    @newspaper = Newspaper.new
    render :new
  end

  def create
    @newspaper = Newspaper.new(params[:newspaper])

    if @newspaper.save
      redirect_to newspapers_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += newspaper.errors.full_messages
      render :new
    end
  end

  def index

  end

  def show
    @newspaper = Newspaper.find(params[:id]).includes(:subscription_plans)
    @subscription_plans = @newspaper.subscription_plans

    render :show
  end
end
