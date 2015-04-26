id = "<%= "#{item.model_name.element}_#{item.id}" %>"
line = $("##{id}").replaceWith $("<%= escape_javascript(render item) %>")
$("#edit_#{id}").remove()
