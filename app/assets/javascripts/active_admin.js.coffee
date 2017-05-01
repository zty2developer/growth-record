#= require active_admin/base
#= require active_bootstrap_skin
#

# $(document).on 'turbolinks:load', ->
# $(document).ready ->
#   get_ele = (id) ->
#     document.getElementById id
#
#   Editor = (input, preview) ->
#
#     @update = ->
#       preview.innerHTML = markdown.toHTML(input.value)
#       return
#
#     input.editor = this
#     @update()
#     return
#
#   new Editor(get_ele('text-input'), get_ele('preview'))
#
$(document).ready ->
  converter = new showdown.Converter()
  converter.setOption 'omitExtraWLInCodeBlocks', 'true'

  text = $('#text-input').val()
  $('#preview')[0].innerHTML = converter.makeHtml text

  get_ele = (id) ->
    document.getElementById id

  Editor = (input, preview) ->
  
    @update = ->
      preview.innerHTML = converter.makeHtml(input.value)
      return
    
    input.editor = this
    @update
    return

  new Editor(get_ele('text-input'), get_ele('preview'))
