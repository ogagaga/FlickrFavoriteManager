# -*- coding: utf-8 -*-
class Category < ActiveRecord::Base
  has_many :favorite_images, :dependent => :nullify
  validates_associated :category

  accepts_nested_attributes_for :favorite_images, :allow_destroy => true

  validates :name, :presence => true

end
