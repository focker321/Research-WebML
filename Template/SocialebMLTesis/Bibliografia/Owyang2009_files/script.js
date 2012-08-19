/* Author:
Rebecca Kemnitz <rebecca.kemnitz@gmail.com>
*/

(function() {

  $('.current_page_item','#access').addClass('active open');

  var _base;

  $('.page_item', '#access').hover(function() {
    $(this).addClass('active').siblings('.open').removeClass('active');
      }, function() {
    $(this).removeClass('active');
    $('.open','#access').addClass('active');
  });

  /*$('.page_item', '#access').hover(function(e) {
    if (e.type === 'mouseenter') {
      return $(this).addClass('active').siblings('.open').removeClass('active');
    } else {
      $(this).removeClass('active');
      return $('.open','#access').addClass('active');
    }
  });*/

}).call(this);