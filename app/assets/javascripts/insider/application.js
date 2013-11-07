//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-bootstrap
//= require angular-ui
//= require angular-ui-bootstrap
//= require angular-ui-bootstrap-tpls
//= require_self
//= require_tree .

var channels = [{first_name: 'josh', channel: 'foo'}];

var current_user = {first_name: 'tataihono', last_name: 'nikora'};

var app = angular.module('insider', ['ui.directives', 'ui.bootstrap', 'ng-rails-csrf', 'monospaced.elastic', 'angularMoment']).config(['$routeProvider', function($routeProvider) {}]);