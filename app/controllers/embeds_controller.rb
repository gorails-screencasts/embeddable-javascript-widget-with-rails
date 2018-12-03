class EmbedsController < ApplicationController
  include ActionView::Helpers::AssetUrlHelper
  include Webpacker::Helper

  protect_from_forgery except: :show

  def show
    respond_to do |format|
      format.js  { redirect_to sources_from_pack_manifest(["embed"], type: :javascript).first }
      format.css { redirect_to sources_from_pack_manifest(["embed"], type: :stylesheet).first }
    end
  end
end
