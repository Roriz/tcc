angular.module('licagro').directive("sendToDefault", function() {
  return {
    controller: ['$element',
      function($element) {
        $element.on('click', function() {
          window.location = "/"
        });
      }
    ]
  }
})