// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){

  $('[data-next-panel]').on('click', nextPanel);

  $('form').on('keydown', 'input,textarea', function(e){
    if (e.keyCode != 13) return;
    return nextPanel();
  });

  $('form').on('submit', function(e){
    return nextPanel()
  })

  function nextPanel() {
    $panel = $('.current_panel');
    var valid;
    if (valid = validate_panel($panel)) {
      $panel.removeClass('current_panel')
        .next('.panel').addClass('current_panel')
        .find('input,select,textarea').first().trigger('focus')
    }

    return valid && $('.current_panel').length == 0
  }

  function validate_panel($panel) {
    var errors_found = false;

    $('[data-required]', $panel).find('input, select').each(function(){
      $input = $(this);
      var error = false;
      if ($input.is('[type=checkbox]')) {
        error = !$input.is(':checked');
      } else {
        error = $input.val() == '';
      }
      if (error) {
        $input.closest('.field').addClass('field_with_errors')
        errors_found = true;
        console.error(this)
      } else {
        $(this).closest('.field').removeClass('field_with_errors')
      }
    });
    
    return !errors_found
  }


  function hasNextPanel() {
    return !$('.panel').last().hasClass('current_panel');
  }


});