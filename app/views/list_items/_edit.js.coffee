id = "<%= "#{item.model_name.element}_#{item.id}" %>"
line = $("##{id}")
form = $("<%= escape_javascript(render partial: 'list_items/edit_form', object: item, as: 'item') %>")
line.hide()
line.after(
  $("<tr id='edit_#{id}'/>").append $("<td colspan=3 />").append form
)

