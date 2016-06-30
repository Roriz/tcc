angular.module('licagro').directive("datepicker", function() {
  return {
    require: 'ngModel',
    restrict: 'A',
    scope: true,
    link: function($scope, elem, attrs, ngModel) {
      elem.datetimepicker({
        format: "d/m/Y",
        timepicker: false,
        closeOnDateSelect: true,
        closeOnTimeSelect: true
      });


      ngModel.$validators.dateValidate = function(value) {
        return value && value.length == 10 && value.split('/').length == 3;
      };

    }
  };
})