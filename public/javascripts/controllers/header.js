var app = angular.module('licagro');

app.controller('HeaderCtrl', ['Layout', '$scope', '$routeParams', 'menus',
  function(Layout, $scope, $routeParams, menus) {
    this.menus = menus;
    $scope.layout = Layout;
    $scope.user = CURRENTUSER;
    $scope.menuOpened = 1;
  }
])