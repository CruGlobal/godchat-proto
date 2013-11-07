 app.controller('VisitorController', function($scope, socket) {
  $scope.messages = [];

  $scope.channel = socket.subscribe('presence-' + $scope.user.channel);
  
  $scope.sendMessage = function () {

    $scope.channel.trigger('client-insider-message', { message: $scope.message });
    
    $scope.messages.push({
      user: current_user,
      text: $scope.message,
      me: true
    });

    // clear message box
    $scope.message = '';
  };
});