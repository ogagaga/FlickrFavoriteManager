# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


titles = [
  "夏の空",
  "空 - 1104",
  "北海道-羊蹄山",
  "みたら室蘭　風車",
  "地球岬からの空",
  "小樽港高島方面からの初日の出"
]

ownernames = [
  "comolebi*",
  "2010faw",
  "yiying333",
  "y_ogagaga",
  "y_ogagaga",
  "y_ogagaga"
]

flickr_user_ids = [
  "41856075@N06",
  "54467908@N05",
  "101329110@N06",
  "50463420@N06",
  "50463420@N06",
  "50463420@N06"
]

photo_source_url_ns = [
  "http://farm7.staticflickr.com/6142/6004555819_beedc97dc0.jpg",
  "http://farm2.staticflickr.com/1096/5144395775_87c9a1d73d.jpg",
  "http://farm3.staticflickr.com/2842/9674430297_1c37e68c7f.jpg",
  "http://farm5.staticflickr.com/4154/5021249195_107bdd54d0.jpg",
  "http://farm5.staticflickr.com/4077/5021279925_47a062871b.jpg",
  "http://farm8.staticflickr.com/7168/6609505203_4749fdf052.jpg"
]

web_page_urls = [
  "http://www.flickr.com/photos/41856075@N06/6004555819",
  "http://www.flickr.com/photos/54467908@N05/5144395775",
  "http://www.flickr.com/photos/101329110@N06/9674430297",
  "http://www.flickr.com/photos/50463420@N06/5021249195",
  "http://www.flickr.com/photos/50463420@N06/5021279925",
  "http://www.flickr.com/photos/50463420@N06/6609505203"
]

5.times do |n|
  FavoriteImage.create(
                :title => titles[n],
                :ownername => ownernames[n],
                :flickr_user_id => flickr_user_ids[n],
                :web_page_url => web_page_urls[n],
                :photo_source_url_n => photo_source_url_ns[n]
    )
end

%w(海 空 小樽).each do
  |name| Category.create(:name => name)
end

favorite_images = FavoriteImage.all
categories = Category.all
categories[1].favorite_images << favorite_images[0]
categories[0].favorite_images << favorite_images[1]
categories[2].favorite_images << favorite_images[2]
categories[1].favorite_images << favorite_images[4]
categories[0].favorite_images << favorite_images[3]
