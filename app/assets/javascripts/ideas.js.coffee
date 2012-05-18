# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
  # Where there is change in the typeahead text box
  $('#idea_category_ids').on 'change', (e) -> 
    add_category @

  # When the enter key is pressed, prevent further action
  $('#idea_category_ids').on 'keypress', (e) ->
    console.log('up')
    if e.keyCode == 13 
      add_category @
      return false
    true

  $("#idea_categories").on 'click', ".token-input-delete-token-facebook", -> 
    $(this).parent().remove()
    
window.add_category = (ele) ->
  $ele = $(ele)

  # TODO: Check for duplicate categories
  categories = []
  exists = false
  for cat in $("#idea_categories ul li").find('input:hidden')
    do (cat) ->
      categories.push $(cat).val()
      exists = true if $ele.val() == $(cat).val()

  if not exists
    # Add the category
    li = $("<li>", { class: 'token-input-token-facebook' })
    li.append($("<p>").text($ele.val()))
    li.append($("<span>", { class: "token-input-delete-token-facebook" }).text('x'))
    li.append($("<input>", { name: 'cat[]', type: 'hidden', value: $ele.val() }))
  
    $('#idea_categories ul').append(li)

  $ele.val ''
  

