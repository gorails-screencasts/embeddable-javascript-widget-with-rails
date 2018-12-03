class Api::V1::DiscussionsController < ApplicationController
  def show
    @site = Site.by_url(params[:id])

    if @site.present?
      @discussion = @site.discussions.by_url(params[:id])
      render "discussions/show"
    else
      render json: { error: "Site has not been registered." }
    end
  end
end
