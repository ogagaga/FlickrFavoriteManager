require 'spec_helper'

describe "favorite_images/index" do
  before(:each) do
    assign(:favorite_images, [
      stub_model(FavoriteImage,
        :title => "Title",
        :ownername => "Ownername_hoge",
        :flickr_user_id => "Flickr User",
        :photo_source_url_n => "photo_source_url",
        :web_page_url => "web_page_url"
      ),
      stub_model(FavoriteImage,
        :title => "Title",
        :ownername => "Ownername_hoge",
        :flickr_user_id => "Flickr User",
        :photo_source_url_n => "photo_source_url",
        :web_page_url => "web_page_url"
      )
    ])
  end

  it "renders a list of favorite_images" do
    pending "add some examples to (or delete) #{__FILE__}"

    # render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "body img.", :text => "Title".to_s, :count => 2
    # assert_select "body div#favorite_images_list", :text => "Ownername_hoge".to_s, :count => 2
    # assert_select "div#favorite_images_list", :text => "Flickr User".to_s, :count => 2
    # assert_select "div#favorite_images_list", :text => "photo_source_url".to_s, :count => 2
    # assert_select "div#favorite_images_list", :text => "web_page_url".to_s, :count => 2
  end
end
