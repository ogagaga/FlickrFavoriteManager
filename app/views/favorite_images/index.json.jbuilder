json.array!(@favorite_images) do |favorite_image|
  json.extract! favorite_image, :title, :ownername, :flickr_user_id, :photo_source_url_n
  json.url favorite_image_url(favorite_image, format: :json)
end
