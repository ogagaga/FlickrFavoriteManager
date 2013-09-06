# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite_image do
    title "MyString"
    ownername "MyString"
    flickr_user_id "MyString"
    photo_source_url_n "MyText"
  end
end
