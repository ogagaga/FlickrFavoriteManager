# -*- coding: utf-8 -*-
class TopController < ApplicationController
  before_filter :index_args, :only => ["index"]

  def index
    @interestingness = flickr.interestingness.getList(@args)
    #logger.debug("#{@interestingness.inspect}")
  rescue
    # TODO:API is error
    logger.error "Flickr is not available"
  end

  private
  def index_args
    @args = {}
    @args[:text] = params[:q]
    @args[:extras] = "owner_name, url_n"
    # the default is street only granularity [16], which most images aren't...
    @args[:accuracy] = 1
    @args[:per_page] = 100
  end

end
