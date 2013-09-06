# -*- coding: utf-8 -*-
class SearchController < ApplicationController
  before_filter :search_args, :only => ["search"]

  def search
    begin
    # logger.debug("params: #{params.inspect}")
    unless params[:q].blank?
      @discovered_pictures = flickr.photos.search(@args)
      # logger.debug("#{@discovered_pictures.inspect}")
    end
    rescue
      logger.error "Flickr is not available"
    end
    render :template => "top/index"
  end

  private
  def search_args
    # TODO:検索オプションダイアログを作成する
    #      何かJSのフレームワークで作ってみるかー。angular ?
    @args = {}
    @args[:text] = params[:q]
    # params[:q].gsub(/[\s　]/, "+")
    # 空白spあると自動でand検索になる。 "-"を付けると除外できる
    @args[:extras] = "owner_name"
    # the default is street only granularity [16], which most images aren't...
    @args[:accuracy] = 1 

    # @args[:user_id] = params[:hoge]
    # @args[:tags] = params[:hoge]
    # @args[:] = params[:hoge]
    # @args[:] = params[:hoge]
    # @args[:] = params[:hoge]
    # date-posted-desc	アップロード日時の新しい順
    # date-taken-desc	撮影日時の新しい順
    # license	ライセンス種別
  end

end
