function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".field").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
//  $(link).parent().after(content.replace(regexp, new_id));
  $(link).parent().parent().parent().next().append(content.replace(regexp, new_id));

}