angular.module('licagro').directive("layoutFooter", function() {
  return {
    restrict: 'A',
    templateUrl: function(elem, attr) {
      return "/javascripts/views/layout/footer.html";
    }
  };
})