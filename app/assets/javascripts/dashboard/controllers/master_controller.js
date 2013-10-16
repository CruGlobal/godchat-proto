app.controller('MasterController', function($scope, $modal, socket) {
  $scope.users = [];
  $scope.auth = {
      "secret": "operatorSecret",
      "token": "abc",
    "time": (new Date()).getTime(),
    "location": window.location.href
  };

  $scope.selectedConversation = null;

  // Socket listeners
  // ================

  socket.bind('call_connected', function (data) {
    $scope.users.push(data);
  });

  // Private helpers
  // ===============
  var authenticate = function() {
      $scope.call_center = socket.subscribe('presence-call-center');

      $scope.call_center.bind('call_request', function (data) {
        var modalInstance = $modal.open({
          templateUrl: 'call_request.html',
          controller: 'CallDialogController',
          resolve: {
            data: function () {
              return data;
            }
          }
        });
      });
  };

  $scope.selectConversation = function(user){
    $scope.selectedConversation = user;
  };

  $scope.capitaliseFirstLetter = function(string){
    return string.charAt(0).toUpperCase() + string.slice(1);
  };



  authenticate();

});