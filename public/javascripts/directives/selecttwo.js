angular.module('licagro').directive("selecttwo", function() {
  return {
    require: 'ngModel',
    restrict: 'A',
    scope: true,
    link: function($scope, elem, attrs, ngModel, $watch) {
      setTimeout(function() {
        elem.select2();
      }, 0);
      setTimeout(function() {
        elem.trigger('change');
      }, 100);
      $scope.$watch(attrs.ngModel, function(value) {
        setTimeout(function() {
          elem.trigger('change');
        }, 0);
      });
    }
  };
})