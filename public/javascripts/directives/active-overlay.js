angular.module('licagro').directive("activeOverlay", ['$timeout', 'OverlayImg',
  function($timeout, OverlayImg) {
    return {
      restrict: 'A',
      scope: true,
      link: function($scope, elem, attrs) {
        $timeout(function() {
          elem.on.on('click', function() {
            OverlayImg.visible = true;
          });
        }, 0);
      }
    };
  }
])