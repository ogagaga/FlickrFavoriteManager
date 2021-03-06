require 'spec_helper'

describe "favorite_images/new" do
  before(:each) do
    assign(:favorite_image, stub_model(FavoriteImage,
      :title => "MyString",
      :ownername => "MyString",
      :flickr_user_id => "MyString",
      :photo_source_url_n => "MyText",
      :web_page_url => "MyText"
    ).as_new_record)
  end

  it "renders new favorite_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", favorite_images_path, "post" do
      assert_select "input#favorite_image_title[name=?]", "favorite_image[title]"
      assert_select "input#favorite_image_ownername[name=?]", "favorite_image[ownername]"
      assert_select "input#favorite_image_flickr_user_id[name=?]", "favorite_image[flickr_user_id]"
      assert_select "input#favorite_image_photo_source_url_n[name=?]", "favorite_image[photo_source_url_n]"
      assert_select "input#favorite_image_web_page_url[name=?]", "favorite_image[web_page_url]"
    end
  end
end
