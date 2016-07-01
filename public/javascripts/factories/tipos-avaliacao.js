var app = angular.module('licagro');

app.factory('TiposAvaliacao', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('tipos_avaliacao'));
  };
});