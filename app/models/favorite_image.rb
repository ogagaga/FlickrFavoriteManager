# -*- coding: utf-8 -*-
class FavoriteImage < ActiveRecord::Base
  belongs_to :category
  validates_associated :category

  validates :title, :presence => true
  validates :ownername, :presence => true
  validates :flickr_user_id, :presence => true
  validates :web_page_url, :presence => true
  validates :photo_source_url_n, allow_blank: false, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'はGIF,JPG,PNG画像のURLでなければなりません'
  }
  # 上記の記述だと複数行のパラメータを受け付けてしまう
  # ^と$は複数行に対応してない

  validates :category_id, :presence => true

  validate :check_association

  private
  def check_association
    if category_id && !Category.where(:id => category_id).exists?
      errors.add(:base, :missing_category)
      self.category_id = nil
    end
  end

end
