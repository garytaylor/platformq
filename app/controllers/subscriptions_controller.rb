class SubscriptionsController < ApplicationController
  #@TODO This is a workaround as I havent implemented a way to get the authenticity token over the API
  protect_from_forgery except: :create
  def create
    @subscription = Subscription.new params.permit(:name, :email)
    if @subscription.save
      respond_to do |format|
        format.json
      end
    else
      respond_to do |format|
        render :error
      end
    end

  end
end