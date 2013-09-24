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

});


$(function(){
  $.ajax({
    type : 'GET',
    url : 'http://www.flickr.com/services/rest/',
    data : {
      format : 'json',
      method : 'flickr.interestingness.getList',
      api_key : 'Your API key',
      per_page : '10', 
    },
    dataType : 'jsonp',
    jsonp : 'jsoncallback',
    success : _getFlickrPhotos
  });
});

function _getFlickrPhotos(data){
  var dataStat  = data.stat;
  var dataTotal = data.photos.total;
  if (dataStat == 'ok') {
    // success
    alert('success')
    $('#FlickrPhotos').append('<ul></ul>');
    $.each(data.photos.photo, function(i, item){
      var itemFarm = item.farm;
      var itemServer = item.server;
      var itemID = item.id;
      var itemSecret = item.secret;
      var itemTitle = item.title;
      var itemLink = 'http://www.flickr.com/photos/cbn_akey/' + itemID + '/'
      var itemPath = 'http://farm' + itemFarm + '.static.flickr.com/' + itemServer + '/' + itemID + '_' + itemSecret + '_m.jpg'
      var flickrSrc = '<img src="' + itemPath + '" alt="' + itemTitle + '" width="200" height="200">';
      var htmlSrc = '<li><a href="' + itemLink + '" target="_blank">' + flickrSrc + '</a></li>'
          $('#FlickrPhotos ul').append(htmlSrc);
    });
  } else {
    // fail
    alert('failed')
  }
}

