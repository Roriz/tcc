angular.module('licagro').directive("export", function() {
  return {
    restrict: 'A',
    scope: {
      datasource: '=',
    },
    link: function($scope, elem, attrs) {
      elem.on('click', function() {
        var form = $('<form>').attr('action', '/export/xlsx').attr('method', 'post').addClass('hide');
        form.append($('<input/>').attr('name', 'columnDefs').val(JSON.stringify($scope.datasource.columnDefs)))
        form.append($('<input/>').attr('name', 'model').val(JSON.stringify($scope.datasource.model)))
        form.append($('<input/>').attr('name', 'q').val(JSON.stringify($scope.datasource.currentQ)))
        form.append($('<input/>').attr('name', 'filters').val(JSON.stringify($scope.datasource.filters)))
        form.append($('<input/>').attr('name', 'order').val(JSON.stringify($scope.datasource.sortModel)))
        $('body').append(form);
        form.trigger('submit');
        form.remove();
      });
    }
  };
})