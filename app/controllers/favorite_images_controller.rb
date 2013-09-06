# -*- coding: utf-8 -*-
class FavoriteImagesController < ApplicationController
  before_action :set_favorite_image, only: [:show, :edit, :update, :destroy]

  # GET /favorite_images
  # GET /favorite_images.json
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @favorite_images = @category.favorite_images.all
    else
      @favorite_images = FavoriteImage.all
    end
  rescue

  end

  # GET /favorite_images/1
  # GET /favorite_images/1.json
  def show
  end

  # GET /favorite_images/new
  def new
    if params[:type] == "add"
      @favorite_image = FavoriteImage.new
      @favorite_image.title = params[:favorite_image][:title]
      @favorite_image.ownername = params[:favorite_image][:ownername]
      @favorite_image.flickr_user_id = params[:favorite_image][:owner]
      @favorite_image.web_page_url = params[:favorite_image][:web_page_url]
      @favorite_image.photo_source_url_n = params[:favorite_image][:photo_source_url_n]
      return
    end
    @favorite_image = FavoriteImage.new
  end

  # GET /favorite_images/1/edit
  def edit
  end

  # POST /favorite_images
  # POST /favorite_images.json
  def create
    @favorite_image = FavoriteImage.new(favorite_image_params)
    @favorite_image.category_id = params[:category][:category_id]

    respond_to do |format|
      if @favorite_image.save
        format.html { redirect_to @favorite_image, notice: 'Favorite image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @favorite_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @favorite_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_images/1
  # PATCH/PUT /favorite_images/1.json
  def update
    @favorite_image.category_id = params[:category][:category_id]
    respond_to do |format|
      if @favorite_image.update(favorite_image_params)
        format.html { redirect_to @favorite_image, notice: 'Favorite image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @favorite_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_images/1
  # DELETE /favorite_images/1.json
  def destroy
    @favorite_image.destroy
    respond_to do |format|
      format.html { redirect_to favorite_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_image
      @favorite_image = FavoriteImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_image_params
      params.require(:favorite_image).permit(:title, :ownername, :flickr_user_id, :photo_source_url_n)
    end
end
