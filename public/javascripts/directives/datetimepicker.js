angular.module('licagro').directive("datetimepicker", function() {
  return {
    require: 'ngModel',
    restrict: 'A',
    scope: true,
    link: function($scope, elem, attrs, ngModel) {
      elem.datetimepicker({
        format: "d/m/Y H:m",
        timepicker: true,
        closeOnDateSelect: true,
        closeOnTimeSelect: true
      });


      ngModel.$validators.dateValidate = function(value) {
        return value && value.length == 16 && value.split('/').length == 3 && value.split(':').length == 2;
      };

    }
  };
})