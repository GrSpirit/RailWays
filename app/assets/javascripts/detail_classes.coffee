# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("input[type=buttun]").click(e) ->
    e.preventDefault()
    form = $(this).parents("tr:first")
    id = form.attr("id").substr(5)
    form.remove()
    $("##{id}").show()
