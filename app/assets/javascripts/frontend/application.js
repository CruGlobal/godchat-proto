//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(function() {
  var page = $("body").data("page");
  if("object" === typeof window[page])
    window[page].init();
});
