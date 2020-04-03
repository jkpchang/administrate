//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require selectize
//= require moment
//= require datetime_picker
//= require_tree .
//= require bootstrap-select

$(function () {

  // -------------------------
  // support add modal
  // -------------------------

  $(function() {
    $(".add-model-btn").click(function() {
      $("#add-modal").modal({remote: $(this).data("add-model-url")});
    });
  });

  $('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
  });

  // -------------------------
  // float table
  // -------------------------
  $('table.collection-data').floatThead();

  // -------------------------
  // font and color pickers
  // -------------------------
  $('.colorpicker-component').colorpicker({});
  $('input.font-picker').fontselect();

  // -------------------------
  // tiny mce field
  // -------------------------
  tinymce.init({
    selector: 'textarea.tinymce',
    height: 200,
    relative_urls: false,
    document_base_url: "http://www.blah.com",
    plugins: [
      'advlist autolink lists link image charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table contextmenu paste code'
    ],
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | code '
  });

  // -------------------------
  // drag and drop to reorder
  // -------------------------
  $(".tablednd").tableDnD({
    onDragClass: "tableDragClass",
    onDragStop: function(table, row) {

      // get new order of resoruce IDs
      var rows = table.tBodies[0].rows;
      var id_arr = ""
      for (var i=0; i< rows.length; i++) {
        id_arr += $(rows[i]).attr("resource-id") +",";
      }
      console.log(id_arr);

      // retrieve patch URL from table
      url = $(table).data("reorder-url");

      // submit ajax call
      $.ajax({
        url: url,
        method: "PATCH",
        data : "ids=" + id_arr,
        success: function(data, textStatus, jqXHR) {
          console.log("done!");
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log("status:" + jqXHR.status);
        }
      });
    }
  });

  // add live search to all select pickers
  $(".selectpicker").each(function(index, item) {
    $(item).attr("data-live-search", "true");
  })

});

