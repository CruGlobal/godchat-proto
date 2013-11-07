 app.controller('VisitorController', function($scope, socket) {
  $scope.messages = [];

  $scope.channel = socket.subscribe('presence-' + $scope.user.channel);

  /*
  socket.on('chatter_message:' + $scope.user.conversation_token, function (data) {
    data.name = $scope.user.name;
    data.me = false;
    $scope.messages.push(data);
  });

  socket.on('self_message:' + $scope.user.conversation_token, function (data) {
    data.name = $scope.user.name;
    data.me = true;
    $scope.messages.push(data);
  });

  */
  $scope.sendMessage = function () {

    $scope.channel.trigger('client-insider-message', { message: $scope.message });
    
    $scope.messages.push({
      user: $scope.$parent.me,
      text: $scope.message,
      me: true
    });

    // clear message box
    $scope.message = '';
  };
});