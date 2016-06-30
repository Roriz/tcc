var app = angular.module('licagro');

app.controller('MenuCtrl', ['$scope', '$routeParams', 'menus',
  function($scope, $routeParams, menus) {
    this.menus = menus;
    $scope.ISMOBILE = ISMOBILE;
  }
])