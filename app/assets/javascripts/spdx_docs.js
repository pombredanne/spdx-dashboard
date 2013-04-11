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