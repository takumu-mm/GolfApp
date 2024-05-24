class CommentsController < ApplicationController
  before_action :set_video
  before_action :set_comment, only: [:destroy]

  def create
    @shared_video = SharedVideo.find(params[:shared_video_id])
    @comment = @shared_video.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to shared_video_path(@shared_video)
    else
      respond_to do |format|
        format.html { render 'shared_videos/show' }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("errors", partial: "shared/error_messages", locals: { object: @comment })
        end
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @shared_video = @comment.shared_video
    @comment.destroy
    redirect_to shared_video_path(@shared_video), notice: 'コメントが削除されました。'
  end

  def update
    @comment.reload unless @comment.update(comment_update_params)
  end

  private

  def set_video
    shared_video = SharedVideo.find(params[:shared_video_id])
    @video = shared_video.video
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :video_id)
  end
end
