var app = angular.module('licagro');

app.factory('AbastecimentoAgua', function(DefaultORM) {
  return _.extend(DefaultORM('abastecimento_agua'), {});
});