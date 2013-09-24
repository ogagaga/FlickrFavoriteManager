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
          var itemLink = item.url_n;
          var itemTitle = item.title;
          var itemOwner = item.owner;
          var itemOwnerName = item.ownername;
          var itemDiv = '<div id="item" class="item">';
          var flickrImgTag = '<img src="' + itemLink + '" alt="' + itemTitle + '">';
          var itemAnchor = '<a href="' + itemLink + '" target="_blank" title="'+  itemTitle + ' by ' + itemOwnerName + ', on Flickr">' + flickrImgTag + '</a>';
          var captionDiv = '<div class="caption">';
          // var favoriteLink = '<div><a href="/favorite_images/new?favorite_image %5B owner %5D =7504867%40N03&amp;favorite_image %5B ownername %5D =cambiodefractal&amp;favorite_image %5B title %5D =sweet+temptation&amp;favorite_image %5B url %5D =http%3A%2F%2Ffarm6.staticflickr.com%2F5488%2F9894618934_d79c6f1e1e.jpg&amp;type=add">Add Favorite image</a></div>';
          var titleDiv = '<div>' + itemTitle + '</div>';
          var ownerDiv = '<div>' + itemOwner + '</div>';
          var ownerNameDiv = '<div>' + itemOwnerName + ', on Flickr</div></div>';
          var endDiv = '</div>';
          el = itemDiv + itemAnchor + captionDiv + titleDiv + ownerDiv + ownerNameDiv + endDiv;
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
      });


    } else {
      $('#read-more').text("もう画像はありません");
    }
  }

});

// function _getFlickrPhotos(data){
//   var dataStat  = data.stat;
//   var dataTotal = data.photos.total;
//   if (dataStat == 'ok') {
//     var $container = $('#container');
//     $container.imagesLoaded(function(){
//       var addHtml = "";
//       $.each(data.photos.photo, function(i, item){
//         var el = '';
//         var itemLink = item.url_n;
//         var itemTitle = item.title;
//         var itemOwner = item.owner;
//         var itemOwnerName = item.ownername;
//         var itemDiv = '<div id="item" class="item">';
//         var flickrImgTag = '<img src="' + itemLink + '" alt="' + itemTitle + '">';
//         var itemAnchor = '<a href="' + itemLink + '" target="_blank" title="'+  itemTitle + ' by ' + itemOwnerName + ', on Flickr">' + flickrImgTag + '</a>';
//         var captionDiv = '<div class="caption">';
//         // var domain = date.Base
//         // var favoriteLink = '<div><a href="/favorite_images/new?favorite_image %5B owner %5D =7504867%40N03&amp;favorite_image %5B ownername %5D =cambiodefractal&amp;favorite_image %5B title %5D =sweet+temptation&amp;favorite_image %5B url %5D =http%3A%2F%2Ffarm6.staticflickr.com%2F5488%2F9894618934_d79c6f1e1e.jpg&amp;type=add">Add Favorite image</a></div>';
//         var titleDiv = '<div>' + itemTitle + '</div>';
//         var ownerDiv = '<div>' + itemOwner + '</div>';
//         var ownerNameDiv = '<div>' + itemOwnerName + ', on Flickr</div></div>';
//         var endDiv = '</div>';
//         el = itemDiv + itemAnchor + captionDiv + titleDiv + ownerDiv + ownerNameDiv + endDiv;
//         addHtml += el;
//       });

//       addHtml = $(addHtml);
//       addHtml.css('display', 'none');
//       $container.append(addHtml);
//       $container.imagesLoaded(function(){
//         addHtml.css('display', 'inline');
//         $container.masonry('appended', addHtml, true);
//         $('#read-more').text("もっと読む");
//       });
//     });


//   } else {
//     $('#read-more').text("もう画像はありません");
//   }
// }


function _getFlickrPhotosError(){
}
