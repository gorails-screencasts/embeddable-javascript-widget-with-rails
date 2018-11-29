class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_discussion

  def create
    @comment = @discussion.comments.new(comment_params)
    @comment.user_agent = request.user_agent
    @comment.ip_address = request.remote_ip

    if @comment.save
      render "comments/show"
    else
      render json: { errors: @comment.errors.full_messages }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end

    def set_discussion
      @discussion = Discussion.by_url(params[:discussion_id])
    end
end

