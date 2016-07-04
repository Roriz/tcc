app.controller('ConsultaCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope', '$mdDialog', 'Status', 'Situacao', 'DateToDB', 'LicenciamentoStatus', 'Avaliacao', 'TiposAvaliacao',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope, $mdDialog, Status, Situacao, DateToDB, LicenciamentoStatus, Avaliacao, TiposAvaliacao) {
    $scope.model = new Licenciamento();
    $FatherScope = $scope;

    $scope.takeLastAvaliacao = function(tb_avaliacao) {
      return new LicenciamentoStatus().last_avaliacao(tb_avaliacao);
    }
    $scope.search = function() {
      $scope.model.query({
        ibram_processo: $scope.model.ibram_processo
      }, function(d) {
        if (d.length) {
          d = _.first(d);
          $scope.model = _.extend($scope.model, d);
          $scope.model.status_last = $scope.model.last_status($scope.model.tb_licenciamento_status);
          $scope.model.showDetails = true;
        } else {
          alertify.warning("Processo não encontrado");
        }
      })
    }


    $scope.include = function(id) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {
          $scope.model = new LicenciamentoStatus();
          new Status().query({}, function(r) {
            $scope.status = r;
          });
          new Situacao().query({}, function(r) {
            $scope.situacao = r;
          });

          $scope.model.tb_licenciamento_id = $FatherScope.model.id;
          $scope.model.td_status_id = $routeParams.type;
          $scope.model.dta = new Date();


          $scope.answer = function(answer) {
            if (answer) {
              $scope.model.create($scope.model, function(model) {
                $FatherScope.model.get($FatherScope.model.id, function(r) {
                  $FatherScope.model = r;
                  $FatherScope.model.showDetails = true;
                });
                $mdDialog.hide(answer);
                alertify.success('Licenciamento atualizado com sucesso!')
              });
            } else {
              $mdDialog.hide(answer);
            }
          };
        },
        templateUrl: '/javascripts/views/licenciamento/status.html',
        parent: angular.element(document.body),
        clickOutsideToClose: true,
        fullscreen: true
      });
    }

    $scope.includeAvaliacao = function(id) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {
          $scope.model = new Avaliacao();
          new TiposAvaliacao().query({}, function(r) {
            $scope.tipos_avaliacao = r;
          });

          $scope.model.tb_licenciamento_id = $FatherScope.model.id;
          $scope.model.td_status_id = $routeParams.type;
          $scope.model.dta = new Date();


          $scope.answer = function(answer) {
            if (answer) {
              $scope.model.create($scope.model, function(model) {
                $FatherScope.model.get($FatherScope.model.id, function(r) {
                  $FatherScope.model = r;
                  $FatherScope.model.showDetails = true;
                });
                $mdDialog.hide(answer);
                alertify.success('Licenciamento atualizado com sucesso!')
              });
            } else {
              $mdDialog.hide(answer);
            }
          };
        },
        templateUrl: '/javascripts/views/licenciamento/dialog-avaliar.html',
        parent: angular.element(document.body),
        clickOutsideToClose: true,
        fullscreen: true
      });
    }
  }
]);