//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-resource
//= require angular-ui
//= require angular-ui-bootstrap
//= require angular-ui-bootstrap-tpls
//= require_self
//= require_tree ../../../../lib/assets/javascripts/angular
//= require_tree ../../../../vendor/assets/javascripts/angular
//= require_tree .

var app = angular.module('operator', ['ui.directives', 'ui.bootstrap', 'ng-rails-csrf', 'monospaced.elastic', 'angularMoment']);
