# -*- coding: utf-8 -*-
class TopController < ApplicationController
  before_filter :index_args, :only => ["index"]
  def index
    # TODO:flickrから取得できなかった場合のエラー処理
    # explore
    @interestingness = flickr.interestingness.getList(@args)
    logger.debug("#{@interestingness.inspect}")

    # # flickr.photos.getRecent
    # @recent_pictures = flickr.photos.getRecent(@args)
    # puts @recent_pictures

    # # flickr.photos.getContactsPhotos
    # @contacts_photos = flickr.photos.getContactsPhotos(@args)
    # puts @contacts_photos
  rescue
    logger.error "Flickr is not available"
  end

  private
  def index_args
    @args = {}
    @args[:text] = params[:q]
    # @args[:extras] = "owner_name, url_sq, url_t, url_s, url_q, url_m, url_n, url_z, url_c, url_l"
    # @args[:extras] = "owner_name, url_sq, url_n"
    @args[:extras] = "owner_name, url_n"
    # the default is street only granularity [16], which most images aren't...
    @args[:accuracy] = 1
    @args[:per_page] = 100
  end

end
