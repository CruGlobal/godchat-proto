//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require angular
//= require angular-bootstrap
//= require angular-ui
//= require angular-ui-bootstrap
//= require angular-ui-bootstrap-tpls
//= require_self
//= require_tree .

var app = angular.module('operator', ['ui.directives', 'ui.bootstrap', 'ng-rails-csrf', 'monospaced.elastic']).
  config(['$routeProvider', function($routeProvider) {
}]);

$(window).load(function(){
  $("#menu a").click(function(e) {
    $('#menu').collapse('hide');
  });
});