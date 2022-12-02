class UsersController < ApplicationController
  def profile
    @user = current_user
    @latest_notes = @user.notes.ordered.first(3)
  end
end