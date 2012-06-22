$(document).ready(function(){
  window.codemirror_editors = {};

  $('.codemirror_feather_cms').each(function(){
    var ele = document.getElementById(this.id);
    codemirror_editors[$(this).attr('id')] = CodeMirror.fromTextArea(ele,
      { mode: "text/html", 
        tabMode: "indent",
        textWrapping: false,
        lineNumbers: true });
  });

});
