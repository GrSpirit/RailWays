$('<%= "#new_#{item.model_name.element}" %>').replaceWith (
  $("<%= escape_javascript(render partial: 'list_items/form', object: item, as: 'item') %>")
)