var app = angular.module('licagro');

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider
      .when('/licenciamento', {
        templateUrl: '/javascripts/views/licenciamento/list.html',
        controller: 'LicenciamentoListCtrl'
      })
      .when('/licenciamento/show/:id', {
        templateUrl: '/javascripts/views/licenciamento/show.html',
        controller: 'LicenciamentoShowCtrl'
      })
      .when('/licenciamento/edit/:id', {
        templateUrl: '/javascripts/views/licenciamento/edit.html',
        controller: 'LicenciamentoEditCtrl'
      })
      .when('/licenciamento/edit', {
        templateUrl: '/javascripts/views/licenciamento/edit.html',
        controller: 'LicenciamentoEditCtrl'
      })
      .when('/licenciamento/edit-li-lo', {
        templateUrl: '/javascripts/views/licenciamento/edit-li-lo.html'
      })
      .when('/licenciamento/avaliar', {
        templateUrl: '/javascripts/views/licenciamento/avaliar.html'
      })
      .when('/home', {
        templateUrl: '/javascripts/views/layout/home.html'
      })


    .when('/consulta', {
      templateUrl: '/javascripts/views/reports/consulta.html'
    })
      .when('/report/analitico-licencas', {
        templateUrl: '/javascripts/views/reports/analitico-licencas.html'
      })
      .when('/report/dados-cadastrais', {
        templateUrl: '/javascripts/views/reports/dados-cadastrais.html'
      })
      .when('/report/licencas-prorrogadas', {
        templateUrl: '/javascripts/views/reports/licencas-prorrogadas.html'
      })
      .when('/report/licencas-vencidas', {
        templateUrl: '/javascripts/views/reports/licencas-vencidas.html'
      })
      .when('', {
        redirectTo: '/home'
      })
      .when('/', {
        redirectTo: '/home'
      })
      .otherwise({
        templateUrl: '/javascripts/views/errors/404.html',
      });

  }
]);