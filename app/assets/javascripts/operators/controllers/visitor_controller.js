 app.controller('VisitorController', function($scope, socket) {
  $scope.messages = [];

  $scope.channel = socket.subscribe('presence-' + $scope.user.channel);
  
  $scope.sendMessage = function () {

    $scope.channel.trigger('client-operator-message', { text: $scope.message, user: current_user });
    
    $scope.messages.push({
      user: current_user,
      text: $scope.message,
      me: true
    });

    // clear message box
    $scope.message = '';
  };

  $scope.channel.bind('client-operator-message', function(data) {
    $scope.messages.push({
      user: data.user,
      text: data.text,
      me: false
    });
  });
});