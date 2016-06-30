    var app = angular.module('licagro');

    app.factory('OverlayImg', function() {
      var overlay = {
        visible: false,
        url: false,
        description: false
      };
      return overlay;
    });