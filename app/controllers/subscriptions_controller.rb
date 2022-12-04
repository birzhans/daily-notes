class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @followings = current_user.followings
    @notes = Note.where(user: @followings).ordered.first(10)
  end

  def destroy
    @user = User.find(params[:id])
    @subscription = Subscription.find_by(user: @user, subscriber: current_user)
    @subscription.destroy
    render turbo_stream: turbo_stream.remove(@user)
  end
end