# FlickrFavoriteManager

FlickrFavoriteManager is an application to manage your own photo you like in Flickr.

FlickrFavoriteManager はFlickrアカウントがない場合にもお気に入り写真を管理できるアプリケーションです。

## 不足している機能(今後対応する)

- Ajaxで写真登録をする
- トップページに表示するExplor写真をAjaxで取得する
  (y_ogagaga/toppage_ajax ブランチで開発中)
- 画像検索処理をAjaxで取得する
- FlickrAPIの戻り値をキャッシュする
- iPhone/iPad用のデザインを作成する
- Flickrの写真URLからお気に入り写真を登録できるようにする

## Requirements

- Ruby: 2.0.0
- Rails: 4.0.0
- DB: MySQL(Maybe, SQlite all right.)
- Gem: See Gemfile

## If you want to try instantly...
### Get a Flickr API key
Your API key is your own unique series of numbers and letters which grant you access to Flickr’s services. 

    http://www.flickr.com/services/apps/create/apply/

### Using OAuth with Flickr

see. http://www.flickr.com/services/api/auth.oauth.html

#### How to get

I run this Script.

    https://github.com/hanklords/flickraw/blob/master/examples/auth.rb

### Configuration

    git clone https://github.com/ogagaga/FlickrFavoriteManager.git
    cd FlickrFavoriteManager
    cp config/database.yml.example.mysql config/database.yml
    cp config/flickr_conf.yml.example config/flickr_conf.yml
    vi config/flickr_conf.yml

``` ruby
flickr:
  api_key: 'Your API key'
  shared_secret: 'Your API key secret'
  access_token: 'Your API key token'
  access_secret: 'Your API key token secret'
```

#### if bundler is not installed.

    gem install bundler 

#### gem install

    bundle install

#### start server

    rake db:migrate
    rake db:seed
    rails s

#### Visit

    http://localhost:3000 with your favorite web browser.

## Credit
* Author: Yutaka OGASAWARA <y.ogagaga@gmail.com>.
* Copyright (c) 2013-2013 Yutaka OGASAWARA.
* License: MIT License.  http://opensource.org/licenses/mit-license.php



