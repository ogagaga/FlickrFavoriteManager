require 'spec_helper'

describe "favorite_images/index" do
  before(:each) do
    assign(:favorite_images, [
      stub_model(FavoriteImage,
        :title => "Title",
        :ownername => "Ownername",
        :flickr_user_id => "Flickr User",
        :photo_source_url_n => "MyText"
      ),
      stub_model(FavoriteImage,
        :title => "Title",
        :ownername => "Ownername",
        :flickr_user_id => "Flickr User",
        :photo_source_url_n => "MyText"
      )
    ])
  end

  it "renders a list of favorite_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Ownername".to_s, :count => 2
    assert_select "tr>td", :text => "Flickr User".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
