app.controller('CallDialogController', function($scope, $modalInstance, data, socket) {
  $scope.data = data;
  $scope.ok = function () {
    socket.emit('accept_call', $scope.data.chatter_token);
    $modalInstance.close();
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});