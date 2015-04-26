class SubscriptionsController < ApplicationController
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