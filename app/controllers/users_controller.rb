class UsersController < ApplicationController
  def autocomplete
    term = params[:q]
    user_ids_with_posts = SharedVideo.pluck(:user_id).uniq
    users = User.where(id: user_ids_with_posts).where('name ILIKE ?', "%#{term}%")
    profiles = Profile.joins(:user).where(user_id: user_ids_with_posts).where('score ILIKE ? OR sports_experience ILIKE ? OR ball_type ILIKE ?', "%#{term}%", "%#{term}%", "%#{term}%")

    @results = []
    users.each do |user|
      @results << OpenStruct.new(id: user.id, name: user.name) if user.name.downcase.include?(term.downcase)
    end

    profiles.each do |profile|
      if profile.score.downcase.include?(term.downcase)
        @results << OpenStruct.new(id: profile.user.id, name: profile.score)
      elsif profile.sports_experience.downcase.include?(term.downcase)
        @results << OpenStruct.new(id: profile.user.id, name: profile.sports_experience)
      elsif profile.ball_type.downcase.include?(term.downcase)
        @results << OpenStruct.new(id: profile.user.id, name: profile.ball_type)
      end
    end

    @results = @results.uniq(&:name).first(5)

    render partial: 'shared_videos/autocomplete_results', locals: { results: @results }
  end
end
