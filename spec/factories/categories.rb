# -*- coding: utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
  end
end

# 関連の書き方はこれだとだめらしい
# # category --> favorite_image
# FactoryGirl.define do
#   factory :category_with_favorite_images, class: Category do
#     name     { FactoryGirl.next(:category_name) }
#     after_create do |category|
#       favorite_images = [
#         FactoryGirl(:favorite_image, :category_id => category.id),
#         FactoryGirl(:favorite_image, :category_id => category.id)
#       ]
#     end
#   end
# end






