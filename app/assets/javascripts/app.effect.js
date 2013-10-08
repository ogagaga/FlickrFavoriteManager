jQuery(function($){
  var baseURI = "";
  var topPageCount = 1;
  var searchPageCount = 1;

  $(function(){
    var $explor_content = $('#explor_content');
    $explor_content.imagesLoaded(function(){
      $('#explor_content').masonry({
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

  function _getInterestingnessList(){
    baseURI = this.location.href;
    $.ajax({
      type : 'GET',
      url : 'http://www.flickr.com/services/rest/',
      data : {
        format : 'json',
        method : 'flickr.interestingness.getList',
        api_key : '2d792fd2e749f0930423f8f322060605',
        extras : "owner_name,url_n",
        per_page : '10',
        page : topPageCount
      },
      dataType : 'jsonp',
      jsonp : 'jsoncallback',
      beforeSend : function(){ $('#read-more').text("読み込み中..."); },
      success : _getFlickrPhotos,
      error: _getFlickrPhotosError
    });
  }

  $(function(){
    _getInterestingnessList();
  });

  $('#read-more').click(function(){
    _getInterestingnessList();
  });

  function _getFlickrPhotos(data){
    var dataStat  = data.stat;
    var dataTotal = data.photos.total;
    if (dataStat == 'ok') {
      $("#search_section").hide();
      var $explor_content = $('#explor_content');
      $explor_content.imagesLoaded(function(){
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
        $explor_content.append(addHtml);
        $explor_content.imagesLoaded(function(){
          addHtml.css('display', 'inline');
          $explor_content.masonry('appended', addHtml, true);
          $('#read-more').text("もっと読む");
        });
        topPageCount += 1;
      });
    } else {
      $('#read-more').text("もう画像はありません");
    }
  }

  function _getSearchList(query, baseuri){
    baseURI = baseuri;
    searchPageCount += 1;
    $.ajax({
      type : 'GET',
      url : 'http://www.flickr.com/services/rest/',
      data : {
        format : 'json',
        method : 'flickr.photos.search',
        api_key : '2d792fd2e749f0930423f8f322060605',
        extras : "owner_name,url_n",
        text : query,
        per_page : '10',
        page : searchPageCount
      },
      dataType : 'jsonp',
      jsonp : 'jsoncallback',
      beforeSend : function(){ $('#search-read-more').text("読み込み中..."); },
      success : _getSearchPhotos,
      error: _getFlickrPhotosError
    });
  }

  $('#search-read-more').click(function(){
    var search_form = $('#q').val();
    var uri = baseURI = this.baseURI;
    _getSearchList(search_form, uri);
  });

  function _getSearchPhotos(data){
    var dataStat  = data.stat;
    var dataTotal = data.photos.total;
    if (dataStat == 'ok') {
      var $search_content = $('#search_content');
      $search_content.imagesLoaded(function(){
        var addHtml = "";
        $.each(data.photos.photo, function(i, item){
          var el = '';
          var itemID = item.id;
          var itemLink = item.url_n;
          var itemTitle = item.title;
          var itemOwner = item.owner;
          var itemOwnerName = item.ownername;
          var itemDiv = '<div id="search_item" class="search_item">';
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
        $search_content.append(addHtml);
        $search_content.imagesLoaded(function(){
          addHtml.css('display', 'inline');
          $search_content.masonry('appended', addHtml, true);
          $('#search-read-more').text("もっと読む");
        });
        searchPageCount += 1;
      });
    } else {
      $('#search-read-more').text("もう画像はありません");
    }
  }

  function _getFlickrPhotosError(){
  }

});

