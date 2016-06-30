var app = angular.module('licagro');

app.factory('SituacaoImovel', function(DefaultORM) {
  return _.extend(DefaultORM('situacao_imovel'), {});
});