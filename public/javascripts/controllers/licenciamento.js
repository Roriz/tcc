var app = angular.module('licagro');

app.controller('LicenciamentoListCtrl', ['$scope', 'Licenciamento', '$location', '$mdDialog',
  function($scope, Licenciamento, $location, $mdDialog) {
    $scope.model = new Licenciamento();

    $scope.dataGrid = {
      buttons: [],
      modelName: 'licenciamento',
      collection: Licenciamento,
      columnDefs: [{
          headerName: "Processo",
          field: "ibram_processo",
          onCellClicked: function(ngGridData) {
            $scope.$apply(function() {
              $location.path('/licenciamento/show/' + ngGridData.data.id);
            })
          },
        }, {
          headerName: "Nome do Requerente",
          field: "tb_requerente.nome",
          valueGetter: function(ngGridData) {
            return _.get(ngGridData.data, ngGridData.colDef.field);
          },
          onCellClicked: function(ngGridData) {
            $scope.$apply(function() {
              $location.path('/licenciamento/show/' + ngGridData.data.id);
            });
          },
        }, {
          headerName: "Localização",
          field: "tb_empreendimento.localizacao",
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
            return _.get($scope.model.last_status(_.get(ngGridData.data, ngGridData.colDef.field)), 'td_situacao.td_status.nome');
          },
          onCellClicked: function(ngGridData) {
            $scope.status(ngGridData.data.id);
          }
        }, {
          headerName: "Situação",
          field: "tb_licenciamento_status",
          valueGetter: function(ngGridData) {
            return _.get($scope.model.last_status(_.get(ngGridData.data, ngGridData.colDef.field)), 'td_situacao.nome');
          },
          onCellClicked: function(ngGridData) {
            $scope.status(ngGridData.data.id);
          }
        },
        // {
        //     headerName: "Actions",
        //     field: "id",
        //     cellRenderer: function(params) {
        //       var prorrogar = $scope.model.can_prorrogar(params.data) ? '<md-button class="md-warn md-raised" ng-click="prorrogar(' + params.data.id + ')">Prorrogar</md-button>' : '';
        //       var renovar = $scope.model.can_renovar(params.data) ? '<md-button class="md-warn md-raised" ng-click="renovar(' + params.data.id + ')">Renovar</md-button>' : '';
        //       return prorrogar + renovar;
        //     }
        //   }]
        // };
        // headerName: "Actions",
        // field: "id",
        // cellRenderer: function(params) {
        //   params.$scope.prorrogar = $scope.prorrogar;
        //   params.$scope.renovar = $scope.renovar;
        //   var prorrogar = $scope.model.can_prorrogar(params.data) ? '<md-button class="md-warn md-raised" ng-click="prorrogar(' + params.data.id + ')">Prorrogar</md-button>' : '';
        //   var renovar = $scope.model.can_renovar(params.data) ? '<md-button class="md-warn md-raised" ng-click="renovar(' + params.data.id + ')">Renovar</md-button>' : '';
        //   return renovar + prorrogar;
        // }
        // }
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
    $scope.model.get($scope.model.id, function(r) {
      $scope.model = r;
    });
  }
]);


app.controller('LicenciamentoEditCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope',
  'SituacaoImovel', 'DestinoEfluente', 'FaseEmpreendimento', 'DestinoLixo', 'EfluenteLiquido', 'AbastecimentoAgua', 'TipoLixoGerado', 'TipoAtividade', 'Status',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope,
    SituacaoImovel, DestinoEfluente, FaseEmpreendimento, DestinoLixo, EfluenteLiquido, AbastecimentoAgua, TipoLixoGerado, TipoAtividade, Status) {
    $scope.model = new Licenciamento();
    new SituacaoImovel().query({}, function(r) {
      $scope.situacao_imovel = r;
    });
    new DestinoEfluente().query({}, function(r) {
      $scope.destino_efluente = r;
    });
    new FaseEmpreendimento().query({}, function(r) {
      $scope.fase_empreendimento = r;
    });
    new DestinoLixo().query({}, function(r) {
      $scope.destino_lixo = r;
    });
    new EfluenteLiquido().query({}, function(r) {
      $scope.efluente_liquido = r;
    });
    new AbastecimentoAgua().query({}, function(r) {
      $scope.abastecimento_agua = r;
    });
    new TipoLixoGerado().query({}, function(r) {
      $scope.tipo_lixo_gerado = r;
    });
    new TipoAtividade().query({}, function(r) {
      $scope.tipo_atividade = r;
    });
    new Status().query({}, function(r) {
      $scope.statuses = r;
    });

    $scope.model.tb_licenciamento_status = [];
    $scope.model.tb_licenciamento_status[0] = {};
    $scope.model.tb_licenciamento_status[0].td_tipos_licenciamento = 'Licença Prévia - LP';
    $scope.model.tb_licenciamento_status[0].dta = new Date();

    if ($routeParams.id) {
      $scope.model.get($routeParams.id, function(r) {
        $scope.model = r;
      });
    }


    $scope.send = function() {
      var model = {};

      angular.copy($scope.model, model);

      window.loading(true);

      if (model.id) {
        var tb_licenciamento_status = model.tb_licenciamento_status;
        tb_licenciamento_status.dta = DateToDB(tb_licenciamento_status.dta);
        model.tb_licenciamento_status = [];
        model.tb_licenciamento_status.push(tb_licenciamento_status);

        $scope.model.update(model, function(response) {
          $rootScope.canChangeRouter = true;
          window.loading(false);
          alertify.success('Licenciamento atualizado com sucesso!');
          if ($scope.model.new == 1) {
            $scope.model = new Licenciamento();
          } else {
            $location.path("licenciamento/show/" + response.id);
          }
        });
      } else {
        $scope.model.create(model, function(response) {
          $rootScope.canChangeRouter = true;
          window.loading(false);
          alertify.success('Licenciamento cadastrado com sucesso!');
          if ($scope.model.new == 1) {
            $scope.model = new Licenciamento();
          } else {
            $location.path("licenciamento/show/" + response.id);
          }
        });
      }
    };

  }
]);


app.controller('LicenciamentoLiLoEditCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope', '$mdDialog', 'Status', 'DateToDB',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope, $mdDialog, Status, DateToDB) {
    $scope.model = new Licenciamento();
    $FatherScope = $scope;

    $scope.search = function() {
      $scope.model.query({
        ibram_processo: $scope.model.ibram_processo
      }, function(d) {
        d = _.first(d);
        $scope.model = _.extend(d, $scope.model);
        $scope.model.showDetails = true;
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

app.controller('LicenciamentoAvaliacaoCtrl', ['Licenciamento', '$location', '$scope', '$routeParams', '$rootScope', '$mdDialog', 'DateToDB', 'TiposAvaliacao',
  function(Licenciamento, $location, $scope, $routeParams, $rootScope, $mdDialog, DateToDB, TiposAvaliacao) {
    $scope.model = new Licenciamento();
    $FatherScope = $scope;

    $scope.search = function() {
      $scope.model.query({
        ibram_processo: $scope.model.ibram_processo
      }, function(d) {
        d = _.first(d);
        $scope.model = _.extend(d, $scope.model);
        $scope.model.showDetails = true;
      })
    }


    $scope.include = function(index) {
      $mdDialog.show({
        controller: function($scope, $mdDialog) {
          $scope.model = new Licenciamento();
          TiposAvaliacao.query({}, function(r) {
            $scope.tipos_avaliacao = r;
            $scope.td_tipos_avaliacao = r[0].nome;
          });
          $scope.dta = new Date();

          $scope.answer = function(answer) {
            if (answer) {
              if (!$FatherScope.model.tb_licenciamento_status[index]['tb_avaliacao']) {
                $FatherScope.model.tb_licenciamento_status[index]['tb_avaliacao'] = [];
              }
              $FatherScope.model.tb_licenciamento_status[index]['tb_avaliacao'].push({
                dta: DateToDB($scope.dta),
                description: $scope.description,
                td_tipos_avaliacao: $scope.td_tipos_avaliacao
              });

              $scope.model.update($FatherScope.model, function(r) {
                r.showDetails = true;
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