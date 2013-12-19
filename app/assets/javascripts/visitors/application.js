//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-ui
//= require angular-ui-bootstrap
//= require angular-ui-bootstrap-tpls
//= require_self
//= require_tree .

var app = angular.module('campaign', ['ui.directives', 'ui.bootstrap', 'ng-rails-csrf', 'monospaced.elastic', 'angularMoment']);