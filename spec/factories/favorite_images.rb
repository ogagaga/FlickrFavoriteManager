# -*- coding: utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite_image do
    category_id "1"
    title "みたら室蘭　風車"
    ownername "y_ogagaga"
    flickr_user_id "50463420@N06"
    web_page_url "http://www.flickr.com/photos/50463420@N06/5021249195"
    photo_source_url_n "http://farm5.staticflickr.com/4154/5021249195_107bdd54d0.jpg"
  end
end
