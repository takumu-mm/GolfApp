class StaticPagesController < ApplicationController
  def top
    @profile = current_user.profile if current_user
  end
end
