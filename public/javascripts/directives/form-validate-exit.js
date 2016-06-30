angular.module('licagro').directive("formValidateExit", ['$rootScope',
  function($rootScope) {
    return {
      restrict: 'A',
      scope: true,
      link: function($scope, elem, attrs) {
        elem.find('[ng-model]').on('focus', function() {
          $rootScope.canChangeRouter = false;
        });
      }
    };
  }
])