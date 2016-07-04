var app = angular.module('licagro');

app.factory('EfluenteLiquido', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('td_efluente_liquido'));
  };
});