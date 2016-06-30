angular.module('licagro').directive("layoutHeader", function() {
  return {
    restrict: 'A',
    templateUrl: function(elem, attr) {
      return "/javascripts/views/layout/header.html";
    }
  };
})