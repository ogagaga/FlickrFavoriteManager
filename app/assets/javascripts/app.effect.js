jQuery(function($){

  $(function(){
    var $container = $('#container');
    $container.imagesLoaded(function(){
      $('#container').masonry({
        itemSelector : '.item',
        isAnimated: true,
        isFitWidth: true
      });
    });

    var $favorite_images_list = $('#favorite_images_list');
    $favorite_images_list.imagesLoaded(function(){
      $('#favorite_images_list').masonry({
        itemSelector : '.thumbnail',
        isAnimated: true,
        isFitWidth: true
      });
    });

  });

  var baseURI = "";
  var nowPage = 1;

  $('#read-more').click(function(){
    // TODO:onloadでも使いたいのであとで関数化する
    baseURI = this.baseURI;
    $.ajax({
      type : 'GET',
      url : 'http://www.flickr.com/services/rest/',
      data : {
        format : 'json',
        method : 'flickr.interestingness.getList',
        api_key : '2d792fd2e749f0930423f8f322060605',
        extras : "owner_name,url_n",
        per_page : '10',
        page : nowPage
      },
      dataType : 'jsonp',
      jsonp : 'jsoncallback',
      beforeSend : function(){ $('#read-more').text("読み込み中..."); },
      success : _getFlickrPhotos,
      error: _getFlickrPhotosError
    });
  });

  function _getFlickrPhotos(data){
    var dataStat  = data.stat;
    var dataTotal = data.photos.total;
    if (dataStat == 'ok') {
      var $container = $('#container');
      $container.imagesLoaded(function(){
        var addHtml = "";
        $.each(data.photos.photo, function(i, item){
          var el = '';
          var itemID = item.id;
          var itemLink = item.url_n;
          var itemTitle = item.title;
          var itemOwner = item.owner;
          var itemOwnerName = item.ownername;
          var itemDiv = '<div id="item" class="item">';
          var flickrImgTag = '<img src="' + itemLink + '" alt="' + itemTitle + '">';
          var itemAnchor = '<a href="' + itemLink + '" target="_blank" title="'+  itemTitle + ' by ' + itemOwnerName + ', on Flickr">' + flickrImgTag + '</a>';
          var captionDiv = '<div class="caption">';
          var favoriteLink = '<div><a href="' + baseURI + 'favorite_images/new?favorite_image%5Bowner%5D=' + itemOwner + '&amp;favorite_image%5Bownername%5D=' + itemOwnerName + '&amp;favorite_image%5Bphoto_source_url_n%5D='+ itemLink + '&amp;favorite_image%5Btitle%5D=' + itemTitle + '&amp;favorite_image%5Bweb_page_url%5D=http%3A%2F%2Fwww.flickr.com%2Fphotos%2F' + itemOwner + '%2F' + itemID + '&amp;type=add">Add Favorite image</a></div>';
          var titleDiv = '<div>' + itemTitle + '</div>';
          var ownerDiv = '<div>' + itemOwner + '</div>';
          var ownerNameDiv = '<div>' + itemOwnerName + ', on Flickr</div></div>';
          var endDiv = '</div>';
          el = itemDiv + itemAnchor + captionDiv + favoriteLink + titleDiv + ownerDiv + ownerNameDiv + endDiv;
          addHtml += el;
        });

        addHtml = $(addHtml);
        addHtml.css('display', 'none');
        $container.append(addHtml);
        $container.imagesLoaded(function(){
          addHtml.css('display', 'inline');
          $container.masonry('appended', addHtml, true);
          $('#read-more').text("もっと読む");
        });
        nowPage += 1;
      });
    } else {
      $('#read-more').text("もう画像はありません");
    }
  }

  function _getFlickrPhotosError(){
  }

});

