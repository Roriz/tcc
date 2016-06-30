var app = angular.module('licagro');

app.controller('BodyController', ['Layout', '$scope', '$route', '$routeParams', '$location',
  function(Layout, $scope, $route, $routeParams, $location, menus) {
    $scope.menus = menus;
    $scope.layout = Layout;
  }
])