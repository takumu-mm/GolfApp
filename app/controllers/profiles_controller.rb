class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[edit update show]

  def edit
    load_form_options
  end

  def update
    user_updated = @profile.user.update_without_password(profile_params[:user_attributes])
    profile_updated = @profile.update(profile_params.except(:user_attributes))
  
    if user_updated && profile_updated
      redirect_to profile_path(@profile),  notice: I18n.t('defaults.flash_message.profile_update')
    else
      @profile.user.errors.full_messages.each do |error|
        @profile.errors.add(:base, error) unless @profile.errors.full_messages.include?(error)
      end unless user_updated
      load_form_options
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def set_profile
    @profile = current_user.profile || current_user.create_profile
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:profile).permit(:score, :ball_type, :sports_experience, :avatar, :avatar_cache, strengths: [], weakness: [], user_attributes: [:id, :name, :email])
  end

  def load_form_options
    @score_options = I18n.t('options.score')
    @ball_type_options =I18n.t('options.ball_type')
    @strength_options = Category.where(name: %w[club environment green_around improvement]).map(&:children).flatten.map { |category| [I18n.t("categories.#{category.name}", default: category.name), category.id] }
    @weakness_options = Category.where(name: %w[club environment green_around shot_miss improvement]).map(&:children).flatten.map { |category| [I18n.t("categories.#{category.name}", default: category.name), category.id] }
  end
end