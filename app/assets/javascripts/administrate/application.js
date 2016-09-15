//= require jquery
//= require jquery_ujs
//= require selectize
//= require moment
//= require datetime_picker
//= require_tree .

$(function () {
  $('table.collection-data').floatThead();

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
});

