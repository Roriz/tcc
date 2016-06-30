angular.module('licagro').directive("textCounter", function() {
  return {
    require: 'ngModel',
    restrict: 'A',
    scope: true,
    link: function($scope, elem, attrs, ngModel, $watch) {
      var defaultValue = attrs.ngMaxlength ? attrs.ngMaxlength : 120;
      elem.wrap($('<div>').addClass('textarea-counter').attr('data-content', '0/' + defaultValue));
      elem.on('keyup', function() {
        var value = elem.val();
        if (value) {
          elem.parent().attr('data-content', elem.val().length + '/' + defaultValue)
        } else {
          elem.parent().attr('data-content', '0/' + defaultValue)
        }
      });
    }
  };
})