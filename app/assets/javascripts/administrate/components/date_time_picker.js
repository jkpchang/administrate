$(function () {
  $(".datepicker").each(function() {
    $(this).datetimepicker({
      debug: false,
      format: $(this).data("format")
    })
  });

  $(".datetimepicker").each(function() {
    $(this).datetimepicker({
      debug: false,
      format: $(this).data("format")
    })
  });
});
