var app = angular.module('licagro');

app.controller('HeaderCtrl', ['OverlayImg', 'Layout', '$scope', '$routeParams', 'menus',
  function(OverlayImg, Layout, $scope, $routeParams, menus) {
    this.menus = menus;
    $scope.layout = Layout;
    $scope.user = CURRENTUSER;
    $scope.menuOpened = 1;
  }
])