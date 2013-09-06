# -*- coding: utf-8 -*-
class FavoriteImage < ActiveRecord::Base
  belongs_to :category

  validates :title, :presence => true
  # validates :title,  :length => { :maximum => 20 }
  validates :ownername, :presence => true
  validates :flickr_user_id, :presence => true
  # validates :photo_source_url_n, :presence => true
  validates :photo_source_url_n, allow_blank: false, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'はGIF,JPG,PNG画像のURLでなければなりません'
  }
  # 上記の記述だと複数行のパラメータを受け付けてしまう
  # ^と$は複数行に対応してない

end
