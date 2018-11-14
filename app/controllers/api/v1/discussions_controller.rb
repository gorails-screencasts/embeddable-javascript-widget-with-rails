class Api::V1::DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.by_url(params[:id])
    render "discussions/show"
  end
end
