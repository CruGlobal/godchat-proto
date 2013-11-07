 app.controller('MessageController', function($scope, socket) {
  $scope.time = new Date();
  // Methods published to the scope
  // ==============================
  $scope.capitaliseFirstLetter = function(string){
    return string.charAt(0).toUpperCase() + string.slice(1);
  };
});