angular.module('licagro').directive("selecttwoRemote", function() {
  return {
    require: 'ngModel',
    restrict: 'A',
    scope: true,
    link: function($scope, elem, attrs, ngModel, $watch) {
      setTimeout(function() {
        elem.select2({
          ajax: {
            url: "/" + attrs['name'] + "/autocomplete",
            dataType: 'json',
            delay: 250,
            data: function(params) {
              return {
                q: params.term, // search term
                page: params.page
              };
            },
            processResults: function(data, params) {
              return {
                results: data
              };
            },
            cache: true
          },
          templateResult: function(data) {
            return data[attrs['text']];
          },
          templateSelection: function(data) {
            return data[attrs['text']] ? data[attrs['text']] : (data.text ? data.text : 'Selecione uma das opções');
          },
        });
      }, 0);

      $scope.$watch(attrs.ngModel, function(value) {
        if (value && _.isObject(value)) {
          var option = $('<option>').attr('selected', true)
          option.attr('value', value.id).text(value[attrs.text])
          elem.append(option);
        }

        setTimeout(function() {
          elem.trigger('change');
        }, 0);
      });
    }
  };
})