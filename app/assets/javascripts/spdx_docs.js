$(document).ready(function() {
  // Handles file uploads
  $(".btn-upload").click(function() {
    var file_input = $("#spdx_doc_upload");
    $("#upload_form .error").hide();

    file_input.trigger('click');
  })

  $("#spdx_doc_upload").change(function(e) {
    var filename = $(this).val().replace("C:\\fakepath\\", "");

    if (filename.length > 0) {
      if(filename.match(/.tag$/)) {
        $(this).parent().submit();
      } else {
        $("#upload_form .error").show();
      }
    }
  })

  // Handles linking to comparison pages
  var comparison_id_first = null;

  $("a[href='#doc_select']").click(function() {
    comparison_id_first = $(this).data("id");
  });

  $("#doc_select td").click(function() {
    var comparison_id_second = $(this).data("id");

    window.location = "spdx_docs/" + comparison_id_first + "/compare?to=" + comparison_id_second;
  })
});