# -*- coding: utf-8 -*-
class Category < ActiveRecord::Base
  has_many :favorite_images
  accepts_nested_attributes_for :favorite_images, :allow_destroy => true

  validates :name, :presence => true

end
