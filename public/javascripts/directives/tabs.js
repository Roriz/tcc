angular.module('licagro').directive("tabs", function() {
  return {
    restrict: 'A',
    scope: true,
    link: function($scope, elem, attrs, ngModel) {
      elem.find('.nav-tabs li').on('click change', function() {
        var href = $(this).attr('data-href');
        if (href) {
          elem.find('.nav-tabs .active').removeClass('active');
          $(this).addClass('active');
          elem.find('[data-tab]').addClass('hide');
          elem.find('[data-tab="' + href + '"]').removeClass('hide');
        }
      });
      elem.find('.nav-tabs li:first-child').trigger('change');
    }
  };
})