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
