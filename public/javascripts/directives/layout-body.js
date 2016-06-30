angular.module('licagro').directive("layoutBody", function() {
  return {
    restrict: 'A',
    templateUrl: function(elem, attr) {
      return "/javascripts/views/layout/body.html";
    }
  };
})