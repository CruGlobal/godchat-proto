app.factory('socket', function ($rootScope) {
  return new Pusher('229ac5d51848deb3b353', {authEndpoint: 'auth'});
});