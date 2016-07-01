var app = angular.module('licagro');

app.factory('SituacaoImovel', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('situacao_imovel'));
  };
});