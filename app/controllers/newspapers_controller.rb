class NewspapersController < ApplicationController

  include NewspapersHelper


  def new
    @newspaper = Newspaper.new
    render :new
  end

  def create
    @newspaper = Newspaper.new(params[:newspaper])
    @plans = populate_plans(params)

    save_failed = false

    ActiveRecord::Base.transaction do
      @newspaper.save

      @plans.each do |plan|
        plan.newspaper = @newspaper
        plan.save
      end

      unless @newspaper.valid? && @plans.all? { |plan| plan.valid?}
        save_failed = true
        raise ActiveRecord::Rollback
      end
    end

    if save_failed
      flash.now[:errors] ||= []
      flash.now[:errors] += @newspaper.errors.full_messages

      @plans.each do |plan|
        flash.now[:errors] += plan.errors.full_messages
      end

      render :new
    else
      redirect_to newspapers_url
    end
  end


  def index
    @newspapers = Newspaper.all
    render :index
  end

  def show
    @newspaper = Newspaper.includes(:subscription_plans).find(params[:id])
    @subscription_plans = @newspaper.subscription_plans

    render :show
  end
end
