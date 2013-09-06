require 'spec_helper'

describe "favorite_images/show" do
  before(:each) do
    @favorite_image = assign(:favorite_image, stub_model(FavoriteImage,
      :title => "Title",
      :ownername => "Ownername",
      :flickr_user_id => "Flickr User",
      :photo_source_url_n => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Ownername/)
    rendered.should match(/Flickr User/)
    rendered.should match(/MyText/)
  end
end
