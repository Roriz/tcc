angular.module('licagro').directive("menu", function() {
  return {
    restrict: 'E',
    templateUrl: function(elem, attr) {
      return "/javascripts/views/layout/menu.html";
    }
  };
})