class CreateFavoriteImages < ActiveRecord::Migration
  def change
    create_table :favorite_images do |t|
      t.integer :category_id, :null => false
      t.string :title
      t.string :ownername
      t.string :flickr_user_id
      t.string :web_page_url
      t.string :photo_source_url_n
      t.timestamps
    end
  end
end
