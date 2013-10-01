# -*- coding: utf-8 -*-
class SearchController < ApplicationController
  before_filter :search_args, :only => ["search"]

  def search
    begin
      unless params[:q].blank?
        @discovered_pictures = flickr.photos.search(@args)
        # logger.debug("#{@discovered_pictures.inspect}")
      end
    rescue
      logger.error "Flickr is not available"
    end
    respond_to do |format|
      format.html { render :template => "top/index"}
      format.js   { render :template => "top/index"}
    end
  end

  private
  def search_args
    @args = {}
    @args[:text] = params[:q]
    # params[:q].gsub(/[\s　]/, "+")
    # 空白spあると自動でand検索になる。 "-"を付けると除外できる
    @args[:extras] = "owner_name"
    @args[:per_page] = 10
  end

end
