$(document).ready(function() {
  $('[data-popup-open]').on('click', function(e)  {
          var targeted_popup_class = jQuery(this).attr('data-popup-open');
          console.log(targeted_popup_class);
          $('[data-popup="' + targeted_popup_class + '"]').slideDown(1000);

          e.preventDefault();
      });

      $('[data-popup-close]').on('click', function(e)  {
          var targeted_popup_class = jQuery(this).attr('data-popup-close');
          $('[data-popup="' + targeted_popup_class + '"]').slideUp(800);

          e.preventDefault();
      });
});
