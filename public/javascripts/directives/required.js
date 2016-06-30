angular.module('licagro').directive("required", function() {
  return {
    restrict: 'E',
    template: '<span class="required">*</span>'
  };
})