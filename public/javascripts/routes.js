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
])
  .run(['$rootScope', '$location', 'menus', '$routeParams', '$route',

    function($rootScope, $location, menus, $routeParams, $route) {
      $rootScope.$on("$routeChangeStart", function(event, next, current) {
        // if ($rootScope.canChangeRouter === false) {
        //   alertify.dialog('confirm')
        //     .set({
        //       transition: 'fade',
        //       'title': 'Mudar rota',
        //       'message': 'Tem certeza que deseja sair deste formulário? Você irá perder as alterações relaizadas nele.',
        //       'onok': function() {
        //         $rootScope.canChangeRouter = true;
        //         $location.path(next.$$route.originalPath);
        //         $route.reload();
        //       }
        //     }).show();
        //   event.preventDefault();
        // }
      });
      $rootScope.$on("$routeChangeSuccess", function(event, next, current) {
        // if (next.$$route) {
        //   var pathToSearch = next.$$route.originalPath.replace(/\/\:(\w+)/, '');
        //   if ($routeParams && $routeParams.showBread) {
        //     pathToSearch += "?" + $.param($routeParams);
        //   }
        //   menus.bread = menus.findbread(menus.list, pathToSearch);
        // }
      });
    }
  ]);