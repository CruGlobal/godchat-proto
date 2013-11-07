 app.controller('SeekerController', function($scope, socket) {
  $scope.messages = [];

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

  $scope.sendMessage = function () {
    socket.emit('new_message', {
      message: $scope.message,
      conversation_token: $scope.user.conversation_token,
      chatter_token: $scope.user.chatter_token
    });
    // add the message to our model locally
    /*$scope.messages.push({
      user: $scope.name,
      text: $scope.message
    });*/

    // clear message box
    $scope.message = '';
  };
});