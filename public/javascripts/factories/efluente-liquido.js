var app = angular.module('licagro');

app.factory('EfluenteLiquido', function(DefaultORM) {
  return _.extend(DefaultORM('efluente_liquido'), {});
});