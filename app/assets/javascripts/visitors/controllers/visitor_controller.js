 app.controller('VisitorController', function($scope, socket) {
  $scope.messages = [];
  $scope.channel = socket.subscribe('presence-' + users[0].channel);
  
  $scope.sendMessage = function () {

    $scope.channel.trigger('client-operator-message', { text: $scope.message, user: current_visitor });
    
    $scope.messages.push({
      user: current_visitor,
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