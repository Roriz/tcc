var app = angular.module('licagro');

app.factory('Responsavel', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('tb_responsavel'));
  };
});