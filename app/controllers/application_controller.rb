class ApplicationController < ActionController::Base
  before_action :set_profile

  private

  def set_profile
    @profile = current_user.profile if current_user
  end
end
