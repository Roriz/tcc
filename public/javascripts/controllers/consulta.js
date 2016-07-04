app.controller('ConsultaCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope', '$mdDialog', 'Status', 'DateToDB', 'LicenciamentoStatus',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope, $mdDialog, Status, DateToDB, LicenciamentoStatus) {
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
          $scope.model.showDetails = true;

          console.log($scope.model.tb_licenciamento_status);
          console.log(d.tb_licenciamento_status);
        } else {
          alertify.warning("Processo não encontrado");
        }
      })
    }


    $scope.include = function(id) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {
          $scope.model = new Licenciamento();
          Status.query({}, function(r) {
            $scope.tipos_licenciamento = r;
          });
          $scope.dta = false;
          Status.get($routeParams.type, function(r) {
            $scope.td_tipos_licenciamento = r.nome;
          });


          $scope.answer = function(answer) {
            if (answer) {
              $scope.model.get(id, function(model) {
                model.tb_licenciamento_status.push({
                  td_tipos_licenciamento: $scope.td_tipos_licenciamento,
                  dta: DateToDB($scope.dta)
                });
                $scope.model.update(model, function(r) {
                  r.showDetails = true;
                  $FatherScope.model = r;
                  $mdDialog.hide(answer);
                  alertify.success('Licenciamento atualizado com sucesso!')
                });
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
  }
]);