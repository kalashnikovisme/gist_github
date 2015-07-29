$ ->
  textarea = document.getElementById('snippet_body')
  unless textarea == null
    CodeMirror.fromTextArea textarea
