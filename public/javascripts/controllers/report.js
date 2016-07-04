app.controller('ReportCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope', '$mdDialog', 'Status', 'Situacao', 'DateToDB', 'LicenciamentoStatus', 'Avaliacao',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope, $mdDialog, Status, Situacao, DateToDB, LicenciamentoStatus, Avaliacao) {
    $FatherScope = $scope;

    new Status().query({}, function(r) {
      $scope.status = r;
    });
    new Situacao().query({}, function(r) {
      $scope.situacao = r;
    });

  }
]);