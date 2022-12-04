class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @followings = current_user.followings
    @notes = Note.where(user: @followings).ordered.first(10)
  end
end