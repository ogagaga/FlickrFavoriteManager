# FlickrFavoriteManager

FlickrFavoriteManager is an application to manage your own photo you like in Flickr.

FlickrFavoriteManager はFlickrアカウントがない場合にもお気に入り写真を管理できるアプリケーションです。

## 対応予定の不足している機能

* 写真登録のAjax対応
* FlickrAPIの戻り値をキャッシュする
* Flickrの写真URLからお気に入り写真を登録できるようにする
* ユーザー管理機能をつけて複数の人が利用できるようにする(ここができたらHerokuへ公開してみる)
* iPhone/iPad用のデザインを作成する

## リファクタリング事項
* トップページと検索結果のAjax処理を統一させる。トップページはJQueryの$ajax、検索はRailsの機能を利用している状態
* validationのCSSを修正

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



