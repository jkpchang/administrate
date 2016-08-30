//= require jquery
//= require jquery_ujs
//= require selectize
//= require moment
//= require datetime_picker
//= require_tree .

$(function() {
  var $table = $('table.collection-data');
  $table.floatThead();

  $('input.color-picker').spectrum({
    color: $(this).val()
  });

  $('input.font-picker').fontselect();

});

