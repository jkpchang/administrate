//= require jquery
//= require jquery_ujs
//= require selectize
//= require moment
//= require datetime_picker
//= require_tree .

$(function () {
  var $table = $('table.collection-data');
  $table.floatThead();

  $('input.color-picker').spectrum({
    color: $(this).val()
  });

  $('input.font-picker').fontselect();

  tinymce.init({
    selector: 'textarea.tinymce',
    height: 200,
    plugins: [
      'advlist autolink lists link image charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table contextmenu paste code'
    ],
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | code '
  });

});

