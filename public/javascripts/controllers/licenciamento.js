var app = angular.module('licagro');

app.controller('LicenciamentoListCtrl', ['$scope', 'Licenciamento', '$location', '$mdDialog',
  function($scope, Licenciamento, $location, $mdDialog) {

    $scope.dataGrid = {
      buttons: [{
        href: '#licenciamento/edit',
        name: 'Criar Novo',
        class: 'btn btnDefault'
      }],
      modelName: 'licenciamento',
      collection: Licenciamento,
      columnDefs: [{
          headerName: "ID",
          field: "id",
          sort: 'desc',
          hide: ISMOBILE,
          onCellClicked: function(ngGridData) {
            $scope.$apply(function() {
              $location.path('/licenciamento/show/' + ngGridData.data.id);
            })
          },
          minWidth: 70,
          maxWidth: 70,
        }, {
          headerName: "Processo",
          field: "ibram_processo",
          onCellClicked: function(ngGridData) {
            $scope.$apply(function() {
              $location.path('/licenciamento/show/' + ngGridData.data.id);
            })
          },
        }, {
          headerName: "Nome do Requerente",
          field: "tb_requerente.name",
          valueGetter: function(ngGridData) {
            return _.get(ngGridData.data, ngGridData.colDef.field);
          },
          onCellClicked: function(ngGridData) {
            $scope.$apply(function() {
              $location.path('/licenciamento/show/' + ngGridData.data.id);
            });
          },
        },
        // {
        //   headerName: "Nome do Destinatario",
        //   field: "tb_requerente.tb_correspondencia.name",
        //   hide: ISMOBILE,
        //   valueGetter: function(ngGridData) {
        //     return _.get(ngGridData.data, ngGridData.colDef.field);
        //   },
        //   onCellClicked: function(ngGridData) {
        //     $scope.$apply(function() {
        //       $location.path('/licenciamento/show/' + ngGridData.data.id);
        //     });
        //   },
        // }, 
        {
          headerName: "Localização",
          field: "tb_requerente.tb_empreendimento.localizacao",
          hide: ISMOBILE,
          valueGetter: function(ngGridData) {
            return _.get(ngGridData.data, ngGridData.colDef.field);
          },
          onCellClicked: function(ngGridData) {
            $scope.$apply(function() {
              $location.path('/licenciamento/show/' + ngGridData.data.id);
            })
          },
        }, {
          headerName: "Status",
          field: "tb_licenciamento_status",
          valueGetter: function(ngGridData) {
            return Licenciamento.last_status(_.get(ngGridData.data, ngGridData.colDef.field)).td_tipos_licenciamento;
          },
          onCellClicked: function(ngGridData) {
            $scope.status(ngGridData.data.id);
          }
        }, {
          headerName: "Prorrogar",
          field: "id",
          onCellClicked: function(ngGridData) {
            $scope.prorrogar(ngGridData.data.id);
          },
          cellRenderer: function(ngGridData) {
            if (Licenciamento.last_status(ngGridData.data.tb_licenciamento_status).td_tipos_licenciamento == 'Licença Prévia - LP' ||
              Licenciamento.last_status(ngGridData.data.tb_licenciamento_status).td_tipos_licenciamento == 'Licença de Instalação - LI') {
              return '<md-button class="md-warn md-raised">Inserir</md-button>';
            } else {
              return '';
            }
          }
        }, {
          headerName: "Renovação",
          field: "id",
          onCellClicked: function(ngGridData) {
            $scope.renovar(ngGridData.data.id);
          },
          cellRenderer: function(ngGridData) {
            if (Licenciamento.last_status(ngGridData.data.tb_licenciamento_status).td_tipos_licenciamento == 'Licençca de Operação - LO') {
              return '<md-button class="md-primary md-raised">Inserir</md-button>';
            } else {
              return '';
            }
          }
        }, {
          headerName: "Editar",
          field: "id",
          cellRenderer: function(params) {
            return '<a href="#licenciamento/edit/' + params.value + '" class="btn icon iconEdit btnPrimary"></a>';
          }
        }
      ]
    };

    var saveDialog = function(answer, attrs) {
      if (answer) {
        Licenciamento.get(id, function(model) {
          model = _.extend(model, attrs);
          Licenciamento.update(model, function() {
            $mdDialog.hide(answer);
            alertify.success('Licenciamento atualizado com sucesso!')
          });
        });
      } else {
        $mdDialog.hide(answer);
      }
    }

    $scope.status = function(id) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {

          $scope.tipos_licenciamento = JSON.parse(localStorage.getItem('tipos_licenciamento'));
          $scope.dta = false;
          $scope.td_tipos_licenciamento = false;
          Licenciamento.get(id, function(model) {
            $scope.model = model;
            $scope.model.tb_licenciamento_status = _.sortBy($scope.model.tb_licenciamento_status, function(o) {
              return o.dta;
            });
          });


          $scope.answer = function(answer) {
            if (answer) {
              Licenciamento.get(id, function(model) {
                model.tb_licenciamento_status.push({
                  td_tipos_licenciamento: $scope.td_tipos_licenciamento,
                  dta: $scope.dta.getFullYear() + '-' + _.padStart(($scope.dta.getMonth() + 1), 2, '0') + '-' + $scope.dta.getDate()
                });
                Licenciamento.update(model, function() {
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
    $scope.renovar = function(id) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {
          $scope.renovacao_processo = false;
          $scope.answer = function(answer) {
            saveDialog({
              renovacao_processo: $scope.renovacao_processo
            });
          };
        },
        templateUrl: '/javascripts/views/licenciamento/renovar.html',
        parent: angular.element(document.body),
        clickOutsideToClose: true,
        fullscreen: true
      });
    }
    $scope.prorrogar = function(id) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {
          $scope.prorrogacao_processo = false;
          $scope.answer = function(answer) {
            saveDialog({
              prorrogacao_processo: $scope.prorrogacao_processo
            });
          };
        },
        templateUrl: '/javascripts/views/licenciamento/alterar-status.html',
        parent: angular.element(document.body),
        clickOutsideToClose: true,
        fullscreen: true
      }).then(function(answer) {
        $scope.status = 'You said the information was "' + answer + '".';
      }, function() {
        $scope.status = 'You cancelled the dialog.';
      });
    };
  }
]);


app.controller('LicenciamentoShowCtrl', ['$scope', '$routeParams', 'Licenciamento', '$uibModal',
  function($scope, $routeParams, Licenciamento, $uibModal) {
    $scope.afterRender = function() {};
    $scope.model = {};
    $scope.model.id = $routeParams.id;
    Licenciamento.get($scope.model.id, function(r) {
      $scope.model = r;
    });
  }
]);


app.controller('LicenciamentoEditCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope) {
    $scope.model = Licenciamento;
    $scope.situacao_imovel = JSON.parse(localStorage.getItem('situacao_imovel'));
    $scope.destino_efluente = JSON.parse(localStorage.getItem('destino_efluente'));
    $scope.fase_empreendimento = JSON.parse(localStorage.getItem('fase_empreendimento'));
    $scope.destino_lixo = JSON.parse(localStorage.getItem('destino_lixo'));
    $scope.efluente_liquido = JSON.parse(localStorage.getItem('efluente_liquido'));
    $scope.abastecimento_agua = JSON.parse(localStorage.getItem('abastecimento_agua'));
    $scope.tipo_lixo_gerado = JSON.parse(localStorage.getItem('tipo_lixo_gerado'));
    $scope.tipo_atividade = JSON.parse(localStorage.getItem('tipo_atividade'));
    $scope.tipos_licenciamento = JSON.parse(localStorage.getItem('tipos_licenciamento'));

    $scope.model.tb_licenciamento_status = {};
    $scope.model.tb_licenciamento_status.td_tipos_licenciamento = 'Licença Prévia - LP';

    if ($routeParams.id) {
      Licenciamento.get($routeParams.id, function(r) {
        $scope.model = r;
      });
    }


    $scope.send = function() {
      var model = {};

      angular.copy($scope.model, model);

      window.loading(true);

      if (model.id) {
        var tb_licenciamento_status = model.tb_licenciamento_status;
        model.tb_licenciamento_status = [];
        model.tb_licenciamento_status.push(tb_licenciamento_status);

        Licenciamento.update(model, function(response) {
          $rootScope.canChangeRouter = true;
          window.loading(false);
          alertify.success('Licenciamento atualizado com sucesso!');
          if ($scope.model.new == 1) {
            $scope.model = Licenciamento;
          } else {
            $location.path("licenciamento/show/" + response.id);
          }
        });
      } else {
        Licenciamento.create(model, function(response) {
          $rootScope.canChangeRouter = true;
          window.loading(false);
          alertify.success('Licenciamento cadastrado com sucesso!');
          if ($scope.model.new == 1) {
            $scope.model = Licenciamento;
          } else {
            $location.path("licenciamento/show/" + response.id);
          }
        });
      }
    };

  }
]);


app.controller('LicenciamentoLiLoEditCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope) {
    $scope.model = Licenciamento;


    $scope.search = function() {
      Licenciamento.query({
        ibram_processo: $scope.model.ibram_processo
      }, function(d) {
        $scope.model = d;
        $scope.model.showDetails = true;
      })
    }
    $scope.include = function() {
      console.log('include');
    }
  }
]);