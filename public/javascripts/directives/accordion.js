angular.module('licagro').directive("accordion", ['$timeout',
  function($timeout) {
    return {
      restrict: 'A',
      scope: true,
      link: function($scope, elem, attrs) {
        if ($scope.$last === true) {
          $timeout(function() {
            elem.parent().find('.accordion-card-head').on('click', function() {
              $(this).parent().find('.accordion-card-body').toggle();
            });
          }, 0);
        }
      }
    };
  }
])