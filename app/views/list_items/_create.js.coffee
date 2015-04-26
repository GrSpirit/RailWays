$("<%= escape_javascript(render item) %>").appendTo $('<%= "##{item.model_name.plural}" %>')
$('<%= "#new_#{item.model_name.element}" %>')[0].reset()